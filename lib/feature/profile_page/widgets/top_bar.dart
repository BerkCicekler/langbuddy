part of '../profile_page.dart';

final class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.settingsIconButton,
    required this.logoutIconButton,
  });

  final void Function() settingsIconButton;
  final void Function() logoutIconButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.zero,
              onPressed: settingsIconButton,
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.zero,
              onPressed: logoutIconButton,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
      ],
    );
  }
}

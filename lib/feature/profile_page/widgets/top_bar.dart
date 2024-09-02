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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: settingsIconButton,
          icon: const Icon(Icons.settings),
        ),
        IconButton(
          onPressed: logoutIconButton,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}

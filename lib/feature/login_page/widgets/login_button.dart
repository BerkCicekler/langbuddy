part of '../login_page.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return CustomFormButton(
      onTap: () async {
        context.read<LoginBloc>().add(LoginButtonPressed());
      },
      text: 'CONTINUE',
      size: const Size(300, 50),
    );
  }
}

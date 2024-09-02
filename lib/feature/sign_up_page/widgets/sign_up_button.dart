part of '../sign_up_page.dart';

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return CustomFormButton(
      text: 'Sign Up',
      onTap: () => context.read<SignUpBloc>().add(SignUpButtonPressEvent()),
      size: const Size(300, 50),
    );
  }
}

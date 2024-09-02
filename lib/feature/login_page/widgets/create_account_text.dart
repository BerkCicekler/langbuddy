part of '../login_page.dart';

class _CreateAccountText extends StatelessWidget {
  const _CreateAccountText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Create Account',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            context.router.push(const SignUpRoute());
          },
      ),
    );
  }
}

part of '../sign_up_page.dart';

class _TextFields extends StatelessWidget {
  const _TextFields();

  @override
  Widget build(BuildContext context) {
    final signUpBloc = context.read<SignUpBloc>();
    return Column(
      children: [
        CustomTextFormField(
          controller: signUpBloc.userNameController,
          labelText: 'Nickname',
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: signUpBloc.emailController,
          hint: 'example@mail.com',
          labelText: 'email',
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: signUpBloc.passwordController,
          labelText: 'Password',
        ),
      ],
    );
  }
}

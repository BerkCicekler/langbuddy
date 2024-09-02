part of '../login_page.dart';

class _TextFields extends StatelessWidget {
  const _TextFields();

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Column(
      children: [
        CustomTextFormField(
          controller: loginBloc.emailController,
          validator: (value) {
            if (value == null) {
              return 'Field can not be empty';
            }
            if (!RegExpConstants.email.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          hint: 'example@mail.com',
          labelText: 'email',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          controller: loginBloc.passwordController,
          labelText: 'Password',
        ),
      ],
    );
  }
}

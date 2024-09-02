import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/feature/widgets/button.dart';
import 'package:langbuddy/feature/widgets/text_input.dart';
import 'package:langbuddy/product/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:langbuddy/product/navigation/app_router.dart';

part 'widgets/text_fields.dart';
part 'widgets/sign_up_button.dart';
part 'sign_up_mixin.dart';

@RoutePage()
final class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SignUpMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        formState: _formKey,
        userNameController: _userNameController,
        emailController: _emailController,
        passwordController: _passwordController,
      ),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: _signUpBlocListener,
        child: const _Scaffold(),
      ),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Form(
          key: context.read<SignUpBloc>().formState,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TextFields(),
              SizedBox(height: 20),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

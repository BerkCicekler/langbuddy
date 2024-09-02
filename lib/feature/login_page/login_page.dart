import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langbuddy/feature/widgets/button.dart';
import 'package:langbuddy/feature/widgets/text_input.dart';
import 'package:langbuddy/product/bloc/login_bloc/login_bloc.dart';
import 'package:langbuddy/product/constants/regexp_constants.dart';
import 'package:langbuddy/product/navigation/app_router.dart';

part 'widgets/text_fields.dart';
part 'widgets/login_button.dart';
part 'login_mixin.dart';
part 'widgets/create_account_text.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with _LoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: _loginBlocListener,
        child: const _Scaffold(),
      ),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Form(
          key: loginBloc.formState,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TextFields(),
              SizedBox(height: 15),
              _LoginButton(),
              SizedBox(height: 100),
              _CreateAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

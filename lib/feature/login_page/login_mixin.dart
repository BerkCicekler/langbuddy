part of 'login_page.dart';

mixin _LoginPageMixin on State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;
  late final LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _loginBloc = LoginBloc(_formKey, _emailController, _passwordController);
    _emailController.text = 'example@gmail.com';
    _passwordController.text = 'test';
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _loginBlocListener(BuildContext context, LoginState state) {
    if (state is LoginStateError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
        ),
      );
    }
  }
}

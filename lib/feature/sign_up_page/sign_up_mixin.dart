part of 'sign_up_page.dart';

mixin SignUpMixin on State<SignUpPage> {
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _emailController.text = 'example@gmail.com';
    _passwordController.text = 'test';
  }

  void _signUpBlocListener(BuildContext context, SignUpState state) {
    if (state is SignUpError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
        ),
      );
    }
  }
}

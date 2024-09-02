// ignore_for_file: public_member_api_docs

sealed class LoginState {}

class LoginStateDefault extends LoginState {}

class LoginStateSuccess extends LoginState {}

class LoginStateError extends LoginState {
  LoginStateError(this.error);

  final String error;
}

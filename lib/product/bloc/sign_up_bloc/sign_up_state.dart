// ignore_for_file: public_member_api_docs

sealed class SignUpState {}

final class SignUpDefault extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpError extends SignUpState {
  SignUpError(this.error);
  final String error;
}

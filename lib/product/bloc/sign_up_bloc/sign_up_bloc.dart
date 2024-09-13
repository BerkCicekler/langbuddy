import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/bloc/sign_up_bloc/sign_up_event.dart';
import 'package:langbuddy/product/bloc/sign_up_bloc/sign_up_state.dart';
import 'package:langbuddy/product/extension/dio_exception.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/models/request_models/register_request_model.dart';
import 'package:langbuddy/product/services/authentication/register_auth_service.dart';
import 'package:logger/logger.dart';

export 'sign_up_event.dart';
export 'sign_up_state.dart';

/// Sign Up page's block class
final class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required this.formState,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
  }) : super(SignUpDefault()) {
    on<SignUpButtonPressEvent>(_registerEvent, transformer: droppable());
  }

  final GlobalKey<FormState> formState;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  /// register button tap
  Future<void> _registerEvent(
    SignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    final isValid = formState.currentState?.validate();
    if (isValid == null || isValid == false) {
      return;
    }
    try {
      await GetIt.I<AuthManager>().login(
        RegisterAuthService(
          registerRequestModel: RegisterRequestModel(
            username: userNameController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
      // will only continue if the status code is success
      // its a feature of dio
      emit(SignUpSuccess());
    } on DioException catch (e) {
      Logger().e(e.response?.data);
      emit(SignUpError(e.errorMessage));
      Logger()
        ..e(e.errorMessage)
        ..e(e.message);
    }
  }
}

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/bloc/login_bloc/login_event.dart';
import 'package:langbuddy/product/bloc/login_bloc/login_state.dart';
import 'package:langbuddy/product/extension/dio_exception.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/models/request_models/login_request_model.dart';
import 'package:langbuddy/product/services/authentication/auth_request.dart';
import 'package:logger/logger.dart';

export 'login_event.dart';
export 'login_state.dart';

/// A bloc class for Login Screen
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this.formState,
    this.emailController,
    this.passwordController,
  ) : super(LoginStateDefault()) {
    on<LoginEvent>(_onLoginEvent, transformer: droppable());
  }

  /// form state of the Login screen form
  final GlobalKey<FormState> formState;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    final isValid = formState.currentState?.validate();
    if (isValid == null || isValid == false) {
      return;
    }
    try {
      await GetIt.I<AuthManager>().login(
        AuthAPIRequest(
          loginRequestModel: LoginRequestModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
      // will only continue if the status code is success
      // its a feature of dio
      emit(LoginStateSuccess());
    } on DioException catch (e) {
      emit(LoginStateError(e.errorMessage));
      Logger()
        ..e(e.errorMessage)
        ..e(e.message);
    }
  }
}

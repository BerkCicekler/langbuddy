import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/extension/dio_exception.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/models/language.dart';
import 'package:langbuddy/product/models/request_models/language_set_model.dart';
import 'package:langbuddy/product/navigation/app_router.dart';
import 'package:langbuddy/product/services/network_service.dart';
import 'package:logger/logger.dart';

final class LanguagePickerCubit extends Cubit<Language?> {
  /// Warning: if [isSelectingNative] is true the cubit will update
  /// the user's native language value if its false user's learning language
  /// value will be updated
  LanguagePickerCubit({
    required this.languages,
    required this.initialLanguageValue,
    required this.isSelectingNative,
  }) : super(initialLanguageValue);

  /// control mechanism to update user's native language or
  /// learning language data
  final bool isSelectingNative;

  final List<Language> languages;

  final Language? initialLanguageValue;

  bool get isLanguageChangedAndNotNull =>
      initialLanguageValue != state && state != null;

  void setLanguage(Language? language) {
    print('setting ${language}');
    emit(language);
  }

  void continueButtonPressed() {
    if (state == null) {
      return;
    }
    final authService = GetIt.I<AuthManager>();
    var data = LanguageSetModel.fromUser(authService.user);
    if (isSelectingNative) {
      data = data.copyWith(native: state!.isoCode);
    } else {
      data = data.copyWith(learning: state!.isoCode);
    }
    try {
      NetworkService.instance.baseRequest(
        EndPointEnums.setLanguage,
        APIRequestMethod.POST,
        data.toJson(),
      );
      GetIt.I<AppRouter>().popForced();
      Logger().d('Language picker request successful');
      if (isSelectingNative) {
        Logger().d('New native language is ${state!.isoCode}');
        authService.changeNativeLanguage(state!.isoCode);
      } else {
        Logger().d('New learning language is ${state!.isoCode}');
        authService.changeLearningLanguage(state!.isoCode);
      }
    } on DioException catch (e) {
      Logger().e(e.errorMessage);
    }
  }
}

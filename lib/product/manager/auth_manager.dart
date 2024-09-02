import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/cache/refresh_token_cache.dart';
import 'package:langbuddy/product/manager/friend_manager.dart';
import 'package:langbuddy/product/models/response_models/tokens_response_model.dart';
import 'package:langbuddy/product/models/user.dart';
import 'package:langbuddy/product/services/authentication/IAuth_request.dart';
import 'package:langbuddy/product/services/network_service.dart';
import 'package:logger/logger.dart';

final class AuthManager extends ChangeNotifier {
  /// stores if the user signed in
  bool _isAuthenticated = false;

  /// stores if the user signed in
  bool get isAuthenticated => _isAuthenticated;

  User _user = User.empty();

  /// User's current data
  User get user => _user;

  Future<void> login(IAuthService service) async {
    final response = await service.login();
    if (response == null) {
      return;
    }
    _user = User.fromJson(response);
    _isAuthenticated = true;
    final tokens = TokensResponseModel.fromJson(response);
    await _setTokens(tokens.accessToken, tokens.refreshToken);
    await GetIt.I<FriendManager>().getFriendsAndRequests();
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _user = User.empty();
    await _setTokens('', null);
    notifyListeners();
  }

  Future<void> _setTokens(String accessToken, String? refreshToken) async {
    Logger().i('Access Token and Refresh Token saving');
    NetworkService.instance.setAccessToken(accessToken);
    final refreshTokenManager = RefreshTokenCacheManager();
    await refreshTokenManager.openBox();
    if (refreshToken == null) {
      await refreshTokenManager.removeToken();
    } else {
      await refreshTokenManager.saveRefreshToken(refreshToken);
    }
    await refreshTokenManager.closeBox();
  }

  /// change [user]'s native language variable
  void changeNativeLanguage(String nativeLanguage) {
    _user = _user.copyWith(nativeLanguage: nativeLanguage);
  }

  /// change [user]'s native learning variable
  void changeLearningLanguage(String learningLanguage) {
    _user = _user.copyWith(learningLanguage: learningLanguage);
  }
}

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:langbuddy/firebase_options.dart';
import 'package:langbuddy/product/cache/refresh_token_cache.dart';
import 'package:langbuddy/product/extension/dio_exception.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/manager/friend_manager.dart';
import 'package:langbuddy/product/navigation/app_router.dart';
import 'package:langbuddy/product/services/authentication/refresh_auth.dart';
import 'package:langbuddy/product/services/firebase_messaging.dart';
import 'package:langbuddy/product/services/friend_service.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

/// Product initialization manager class
@immutable
final class ProductInitialization {
  const ProductInitialization._();

  /// this method will do core initializations before the app runs
  static Future<void> mainInit() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessagingService.connectNotification();

    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    _getItInit();

    await _rememberMe();

    FlutterNativeSplash.remove();

    //Logger().d(await FirebaseMessagingService.getToken());
  }

  static void _getItInit() {
    GetIt.I.registerSingleton<AppRouter>(AppRouter());
    GetIt.I.registerSingleton<AuthManager>(
      AuthManager(),
    );
    GetIt.I.registerSingleton<FriendManager>(
      FriendManager(friendService: FriendService()),
    );
  }

  static Future<void> _rememberMe() async {
    final refreshTokenCache = RefreshTokenCacheManager();
    await refreshTokenCache.openBox();
    try {
      if (!await refreshTokenCache.isRefreshTokenExist()) {
        Logger().i("Refresh token couldn't be found in cache");
        return;
      }
      Logger().d('refresh token found in cache');
      final refreshToken = await refreshTokenCache.getRefreshToken();
      await GetIt.I<AuthManager>().login(
        RefreshTokenAuth(
          refreshToken: refreshToken,
        ),
      );
    } on DioException catch (e) {
      Logger().e(e.errorMessage);
    } catch (e) {
      Logger().e(e);
    } finally {
      await refreshTokenCache.closeBox();
    }
  }
}

import 'package:hive/hive.dart';
import 'package:langbuddy/product/constants/enums/cache_enums.dart';

final class RefreshTokenCacheManager {
  final _boxName = CacheBoxNames.refreshToken;

  String get _cacheBoxName => _boxName.name;

  String get _refreshTokenKeyName => CacheKeyNames.refreshTokenKey.name;

  late final Box<String> _box;

  Future<void> openBox() async {
    _box = await Hive.openBox<String>(_cacheBoxName);
  }

  Future<bool> isRefreshTokenExist() async {
    return _box.containsKey(_refreshTokenKeyName);
  }

  Future<String> getRefreshToken() async {
    return _box.get(_refreshTokenKeyName) ?? '';
  }

  Future<void> saveRefreshToken(String token) async {
    await _box.put(_refreshTokenKeyName, token);
  }

  Future<void> removeToken() async {
    await _box.clear();
  }

  Future<void> closeBox() async {
    await _box.close();
  }
}

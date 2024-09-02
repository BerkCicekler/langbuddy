import 'package:hive/hive.dart';
import 'package:langbuddy/product/constants/enums/cache_enums.dart';

class BaseCacheManager<T> {
  Box<T>? _box;
  final CacheBoxNames boxName;

  BaseCacheManager(this.boxName);

  Future<void> openBox() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox<T>(boxName.name);
    }
  }

  Future<void> putItem(CacheKeyNames key, T val) async {
    await openBox();
    await _box?.put(key.name, val);
  }

  Future<T?> getItem(CacheKeyNames key) async {
    await openBox();
    return _box?.get(key.name);
  }

  List<T>? getAllItems() {
    return _box?.values.toList();
  }

  void saveAllItems(List<T>? items) {
    if (items != null) {
      _box?.addAll(items);
    }
  }

  Future<void> clear() async {
    await openBox();
    await _box?.clear();
  }

  Future<bool> containsKey(CacheKeyNames key) async {
    await openBox();
    return _box?.containsKey(key.name) ?? false;
  }

  Future<void> closeBox() async {
    await _box?.close();
  }
}

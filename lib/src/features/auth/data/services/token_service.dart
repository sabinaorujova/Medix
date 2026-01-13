import 'package:hive_flutter/hive_flutter.dart';

class TokenService {
  static const _boxName = 'authBox';
  static const _tokenKey = 'auth_token';

  Future<void> init() async {
    await Hive.openBox(_boxName);
  }

  Future<void> saveToken(String token) async {
    final box = Hive.box(_boxName);
    await box.put(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final box = Hive.box(_boxName);
    return box.get(_tokenKey);
  }

  Future<void> deleteToken() async {
    final box = Hive.box(_boxName);
    await box.delete(_tokenKey);
  }
}

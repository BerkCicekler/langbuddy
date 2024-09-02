abstract class IAuthService {
  /// [login] function always should return the data of the user
  Future<Map<String, dynamic>?> login();
}

import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/services/authentication/IAuth_request.dart';
import 'package:langbuddy/product/services/network_service.dart';

/// Authorization with refresh token
final class RefreshTokenAuth implements IAuthService {
  RefreshTokenAuth({required this.refreshToken});

  final String refreshToken;

  @override
  Future<Map<String, dynamic>?> login() async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.refreshToken,
      APIRequestMethod.POST,
      {'refreshToken': refreshToken},
    );
    return response.data;
  }
}

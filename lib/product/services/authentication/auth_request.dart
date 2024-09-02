import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/models/request_models/login_request_model.dart';
import 'package:langbuddy/product/models/request_models/register_request_model.dart';
import 'package:langbuddy/product/services/authentication/IAuth_request.dart';
import 'package:langbuddy/product/services/network_service.dart';

/// [AuthAPIRequest] class is design for authentication requests
///
final class AuthAPIRequest implements IAuthService {
  AuthAPIRequest({required this.loginRequestModel});

  final LoginRequestModel loginRequestModel;

  ///Login api request if the login success the
  @override
  Future<Map<String, dynamic>?> login() async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.userLogin,
      APIRequestMethod.POST,
      loginRequestModel.toJson(),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      return null;
    }
    return response.data;
  }

  static Future<Map<String, dynamic>?> register(
      RegisterRequestModel model) async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.userSignUp,
      APIRequestMethod.POST,
      model.toJson(),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      return null;
    }
    return response.data;
  }
}

import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/models/request_models/login_request_model.dart';
import 'package:langbuddy/product/services/authentication/IAuth_request.dart';
import 'package:langbuddy/product/services/network_service.dart';

final class LoginAuthService implements IAuthService {
  LoginAuthService({required this.loginRequestModel});

  final LoginRequestModel loginRequestModel;

  /// This function will handle the user's login
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
}

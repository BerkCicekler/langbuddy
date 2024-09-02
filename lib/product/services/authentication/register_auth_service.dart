import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/models/request_models/register_request_model.dart';
import 'package:langbuddy/product/services/authentication/IAuth_request.dart';
import 'package:langbuddy/product/services/network_service.dart';

final class RegisterAuthService implements IAuthService {
  RegisterAuthService({required this.registerRequestModel});

  final RegisterRequestModel registerRequestModel;

  Future<Map<String, dynamic>?> login() async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.userSignUp,
      APIRequestMethod.POST,
      registerRequestModel.toJson(),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      return null;
    }
    return response.data;
  }
}

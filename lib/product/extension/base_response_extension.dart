import 'package:langbuddy/product/models/base_response_model.dart';

extension BaseResponseExtension on BaseResponse {
  bool get isSucceed => statusCode == 200 || statusCode == 201;
}

import 'package:dio/dio.dart';
import 'package:langbuddy/product/constants/api_constants.dart';
import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/models/base_response_model.dart';

final class NetworkService {
  NetworkService._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.url,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
      ),
    );
  }

  static late final Dio _dio;

  //Dio get dio => _dio;

  static final instance = NetworkService._();

  Future<BaseResponse> baseRequest(
    EndPointEnums endPoint,
    APIRequestMethod method,
    Map<String, dynamic>? data,
  ) async {
    final response = await _dio.request<Map<String, dynamic>>(
      ApiConstants.url + endPoint.value,
      data: data,
      options: Options(
        method: method.value,
      ),
    );
    return BaseResponse.fromResponse(response);
  }

  // change the header's accessToken key
  void setAccessToken(String accessToken) {
    _dio.options.headers['Authorization'] = accessToken;
  }
}

import 'package:dio/dio.dart';

extension DioExceptionExtension on DioException {
  /// This getter tries to get server's error message from the [response]
  /// if the server didn't returned a error message getter choses the error message
  String get errorMessage {
    if (response == null) {
      return 'No response found';
    }
    if (response!.data is! Map<String, dynamic>) {
      return 'Unknown Data';
    }
    if (response!.data['error'] != null) {
      return response!.data['error'] as String;
    }
    return 'Unknown error';
  }
}

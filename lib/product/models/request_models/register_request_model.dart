import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()

/// register end point data
final class RegisterRequestModel {
  RegisterRequestModel(
      {required this.userName, required this.email, required this.password});

  final String userName;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}

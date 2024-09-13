import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()

/// register end point data
final class RegisterRequestModel {
  RegisterRequestModel(
      {required this.username, required this.email, required this.password});

  final String username;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}

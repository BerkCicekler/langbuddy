import 'package:json_annotation/json_annotation.dart';

part 'tokens_response_model.g.dart';

@JsonSerializable()
class TokensResponseModel {
  TokensResponseModel(this.accessToken, this.refreshToken);

  final String accessToken;
  final String refreshToken;

  factory TokensResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseModelFromJson(json);
}

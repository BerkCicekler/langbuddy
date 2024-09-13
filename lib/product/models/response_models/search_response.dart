import 'package:json_annotation/json_annotation.dart';
import 'package:langbuddy/product/models/friend.dart';

part 'search_response.g.dart';

@JsonSerializable()
final class SearchResponse {
  SearchResponse(this.searchedUsers);
  final List<Friend> searchedUsers;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

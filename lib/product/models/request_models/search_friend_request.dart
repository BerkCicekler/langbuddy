import 'package:json_annotation/json_annotation.dart';

part 'search_friend_request.g.dart';

@JsonSerializable()
class SearchFriendRequest {
  SearchFriendRequest({required this.native, required this.learning});

  final String native;
  final String learning;

  Map<String, dynamic> toJson() => _$SearchFriendRequestToJson(this);
}

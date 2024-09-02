import 'package:json_annotation/json_annotation.dart';
import 'package:langbuddy/product/models/friend.dart';

part 'friend_response.g.dart';

@JsonSerializable()
class FriendResponse {
  FriendResponse({required this.friends, required this.friendRequests});

  final List<Friend> friends;
  final List<Friend> friendRequests;

  factory FriendResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendResponseFromJson(json);
}

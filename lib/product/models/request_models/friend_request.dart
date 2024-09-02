import 'package:json_annotation/json_annotation.dart';

part 'friend_request.g.dart';

@JsonSerializable()

/// API service accept this model on any kind of friend request
class FriendRequest {
  FriendRequest({required this.targetId});

  final String targetId;

  Map<String, dynamic> toJson() => _$FriendRequestToJson(this);
}

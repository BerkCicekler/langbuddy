import 'package:langbuddy/product/models/friend.dart';

sealed class NotificationEvent {}

final class NotificationRefreshEvent extends NotificationEvent {}

final class NotificationFriendRequestAction extends NotificationEvent {
  NotificationFriendRequestAction({
    required this.targetFriend,
    required this.action,
  });

  final Friend targetFriend;
  final FriendRequestActions action;
}

enum FriendRequestActions {
  ACCEPT,
  REJECT;
}

import 'package:equatable/equatable.dart';
import 'package:langbuddy/product/models/friend.dart';

final class NotificationState extends Equatable {
  NotificationState({required this.friendRequests, required this.state});

  final List<Friend> friendRequests;
  final NotificationStateEnum state;

  @override
  List<Object?> get props => [state, friendRequests];

  NotificationState copyWith({
    List<Friend>? friendRequests,
    NotificationStateEnum? state,
  }) {
    return NotificationState(
      friendRequests: friendRequests ?? this.friendRequests,
      state: state ?? this.state,
    );
  }
}

enum NotificationStateEnum {
  initial,
  loading,
  loaded,
  error;
}

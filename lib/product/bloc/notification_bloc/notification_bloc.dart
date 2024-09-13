import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langbuddy/product/bloc/notification_bloc/notification_event.dart';
import 'package:langbuddy/product/bloc/notification_bloc/notification_state.dart';
import 'package:langbuddy/product/extension/dio_exception.dart';
import 'package:langbuddy/product/manager/friend_manager.dart';
import 'package:logger/logger.dart';

export 'notification_event.dart';
export 'notification_state.dart';

final class NotificationBloc
    extends Bloc<NotificationEvent, NotificationState> {
  ///[friendManager] must be the one that initialized on the start of the
  ///application with getIt
  NotificationBloc({required FriendManager friendManager})
      : _friendManager = friendManager,
        super(
          NotificationState(
            friendRequests: friendManager.friendRequests,
            state: NotificationStateEnum.initial,
          ),
        ) {
    on<NotificationRefreshEvent>(_refreshHandler);
    on<NotificationFriendRequestAction>(_friendActionHandler);
  }

  final FriendManager _friendManager;

  Future<void> _refreshHandler(
    NotificationRefreshEvent event,
    Emitter<NotificationState> emitter,
  ) async {
    emitter(state.copyWith(state: NotificationStateEnum.loading));
    try {
      await _friendManager.getFriendsAndRequests();
      emitter(
        state.copyWith(
          friendRequests: _friendManager.friendRequests,
          state: NotificationStateEnum.loaded,
        ),
      );
    } catch (e) {
      Logger().e(e);
      emitter(
        state.copyWith(
          state: NotificationStateEnum.error,
        ),
      );
    }
  }

  Future<void> _friendActionHandler(
    NotificationFriendRequestAction event,
    Emitter<NotificationState> emitter,
  ) async {
    try {
      switch (event.action) {
        case FriendRequestActions.ACCEPT:
          await _friendManager.acceptFriendRequest(event.targetFriend);

        case FriendRequestActions.REJECT:
          await _friendManager.rejectFriendRequest(event.targetFriend);
        default:
          throw Exception('Unexpected FriendRequest Action');
      }
      await _refreshHandler(NotificationRefreshEvent(), emitter);
    } on DioException catch (e) {
      Logger().e(e.errorMessage);
    }
  }
}

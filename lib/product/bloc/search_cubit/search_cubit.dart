import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/bloc/search_cubit/search_state.dart';
import 'package:langbuddy/product/extension/base_response_extension.dart';
import 'package:langbuddy/product/extension/dio_exception.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/models/friend.dart';
import 'package:langbuddy/product/models/response_models/search_response.dart';
import 'package:langbuddy/product/services/friend_service.dart';
import 'package:logger/logger.dart';

export 'search_state.dart';

final class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.friendService})
      : super(
          SearchState(
            users: const [],
            sendedFriendRequest: const [],
            state: SearchStateEnum.initial,
          ),
        );
  final FriendService friendService;

  Future<void> searchFriend() async {
    final clientUser = GetIt.I<AuthManager>().user;
    emit(
      SearchState(
        users: const [],
        state: SearchStateEnum.loading,
        sendedFriendRequest: state.sendedFriendRequest,
      ),
    );
    try {
      final response = await friendService.searchFriend(clientUser);
      final tempSearchUsers = SearchResponse.fromJson(response.data);
      emit(
        SearchState(
          users: tempSearchUsers.searchedUsers,
          state: SearchStateEnum.loaded,
          sendedFriendRequest: state.sendedFriendRequest,
        ),
      );
    } on DioException catch (e) {
      Logger().e(e.errorMessage);
      emit(
        SearchState(
          users: const [],
          state: SearchStateEnum.fail,
          sendedFriendRequest: state.sendedFriendRequest,
        ),
      );
    }
  }

  Future<void> sendFriendRequest(Friend friend) async {
    try {
      final response = await friendService.sendFriendRequest(friend);
      if (response.isSucceed) {
        final tempSendedFriendRequests = state.sendedFriendRequest.toList();
        tempSendedFriendRequests.add(friend);
        emit(
          SearchState(
            users: state.users,
            state: SearchStateEnum.loaded,
            sendedFriendRequest: tempSendedFriendRequests,
          ),
        );
      }
    } on DioException catch (e) {
      Logger().e(e.response?.data);
      Logger().e(e.message);
      Logger().e(e.errorMessage);
    }
  }
}

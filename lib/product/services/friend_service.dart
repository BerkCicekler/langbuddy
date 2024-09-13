import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/models/base_response_model.dart';
import 'package:langbuddy/product/models/friend.dart';
import 'package:langbuddy/product/models/request_models/friend_request.dart';
import 'package:langbuddy/product/models/request_models/search_friend_request.dart';
import 'package:langbuddy/product/models/user.dart';
import 'package:langbuddy/product/services/network_service.dart';

final class FriendService {
  /// This  requires will find the user's potential friends of the user
  Future<BaseResponse> searchFriend(User client) async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.searchFriend,
      APIRequestMethod.POST,
      SearchFriendRequest(
        native: client.learningLanguage,
        learning: client.nativeLanguage,
      ).toJson(),
    );
  }

  Future<BaseResponse> getFriendsAndRequests() async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.friendsData,
      APIRequestMethod.GET,
      {},
    );
  }

  Future<BaseResponse> acceptFriendRequest(Friend friend) async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.friendRequestAccept,
      APIRequestMethod.POST,
      FriendRequest(targetId: friend.id.toString()).toJson(),
    );
  }

  Future<BaseResponse> rejectFriendRequest(Friend friend) async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.friendRequestReject,
      APIRequestMethod.POST,
      FriendRequest(targetId: friend.id.toString()).toJson(),
    );
  }

  Future<BaseResponse> sendFriendRequest(Friend friend) async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.friendRequestSend,
      APIRequestMethod.POST,
      FriendRequest(targetId: friend.id.toString()).toJson(),
    );
  }
}

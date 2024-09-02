import 'package:langbuddy/product/constants/enums/api_request_method_enum.dart';
import 'package:langbuddy/product/constants/enums/end_point_enums.dart';
import 'package:langbuddy/product/models/base_response_model.dart';
import 'package:langbuddy/product/models/friend.dart';
import 'package:langbuddy/product/models/request_models/friend_request.dart';
import 'package:langbuddy/product/services/network_service.dart';

class FriendService {
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

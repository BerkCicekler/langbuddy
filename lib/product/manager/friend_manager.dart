import 'package:flutter/widgets.dart';
import 'package:langbuddy/product/extension/base_response_extension.dart';
import 'package:langbuddy/product/models/friend.dart';
import 'package:langbuddy/product/models/response_models/friend_response.dart';
import 'package:langbuddy/product/services/friend_service.dart';

/// [FriendManager] class will store the user's friends, friend requests
/// and its also a layer for managing the friends, friend requests, etc
class FriendManager extends ChangeNotifier {
  FriendManager({required FriendService friendService})
      : _friendService = friendService;

  final FriendService _friendService;

  List<Friend> _friends = [];

  List<Friend> get friends => _friends;

  List<Friend> _friendRequests = [];

  List<Friend> get friendRequests => _friendRequests;

  Future<void> getFriendsAndRequests() async {
    final baseResponse = await _friendService.getFriendsAndRequests();
    if (!baseResponse.isSucceed) {
      return;
    }
    final friendResponse = FriendResponse.fromJson(baseResponse.data);
    _friends = friendResponse.friends;
    _friendRequests = friendResponse.friendRequests;
    notifyListeners();
  }

  Future<void> acceptFriendRequest(Friend friend) async {
    final baseResponse = await _friendService.acceptFriendRequest(friend);
    if (!baseResponse.isSucceed) {
      return;
    }
    _friends.add(friend);
    _friendRequests.remove(friend);
    notifyListeners();
  }

  Future<void> rejectFriendRequest(Friend friend) async {
    final baseResponse = await _friendService.rejectFriendRequest(friend);
    if (!baseResponse.isSucceed) {
      return;
    }
    _friendRequests.remove(friend);
    notifyListeners();
  }

  Future<void> sendFriendRequest(Friend friend) async {
    final baseResponse = await _friendService.sendFriendRequest(friend);
    if (!baseResponse.isSucceed) {
      return;
    }
  }
}

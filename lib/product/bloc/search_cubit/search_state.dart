import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langbuddy/product/models/friend.dart';

@freezed
final class SearchState extends Equatable {
  SearchState({
    required this.users,
    required this.state,
    required this.sendedFriendRequest,
  });

  /// The users API found for us
  /// A.K.A. client's potential friends
  final List<Friend> users;

  /// This value will hold the data of the users
  /// the client already send friend request
  final List<Friend> sendedFriendRequest;
  final SearchStateEnum state;

  @override
  List<Object?> get props => [users, sendedFriendRequest, state];
}

enum SearchStateEnum {
  initial,
  loading,
  loaded,
  fail;
}

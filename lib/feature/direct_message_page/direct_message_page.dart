import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/constants/enums/padding_enums.dart';
import 'package:langbuddy/product/manager/friend_manager.dart';
import 'package:langbuddy/product/models/friend.dart';

part 'widgets/friend_request_bell.dart';
part 'widgets/friend_list.dart';

@RoutePage()
final class DirectMessagePage extends StatelessWidget {
  const DirectMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final friendService = GetIt.I<FriendManager>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: ListenableBuilder(
          listenable: friendService,
          builder: (context, widget) {
            return Column(
              children: [
                _FriendRequestBell(
                  isNotificationExist: friendService.friendRequests.isNotEmpty,
                ),
                _FriendList(friends: friendService.friends),
              ],
            );
          },
        ),
      ),
    );
  }
}

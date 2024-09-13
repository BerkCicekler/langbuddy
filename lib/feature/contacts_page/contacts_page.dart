import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/constants/enums/padding_enums.dart';
import 'package:langbuddy/product/manager/friend_manager.dart';
import 'package:langbuddy/product/models/friend.dart';
import 'package:langbuddy/product/navigation/app_router.dart';

part 'widgets/friend_request_bell.dart';
part 'widgets/friend_list.dart';

@RoutePage()
final class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final friendManager = GetIt.I<FriendManager>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(PaddingConstants.page.value),
        child: ListenableBuilder(
          listenable: friendManager,
          builder: (context, widget) {
            return Column(
              children: [
                _FriendRequestBell(
                  isNotificationExist: friendManager.friendRequests.isNotEmpty,
                ),
                _FriendList(friends: friendManager.friends),
              ],
            );
          },
        ),
      ),
    );
  }
}

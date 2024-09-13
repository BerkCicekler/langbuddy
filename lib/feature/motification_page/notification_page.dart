import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/bloc/notification_bloc/notification_bloc.dart';
import 'package:langbuddy/product/constants/enums/padding_enums.dart';
import 'package:langbuddy/product/manager/friend_manager.dart';
import 'package:langbuddy/product/models/friend.dart';

part 'widgets/friend_request.dart';

@RoutePage()
final class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationBloc(friendManager: GetIt.I<FriendManager>())
        ..add(NotificationRefreshEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        body: Padding(
          padding: EdgeInsets.all(PaddingConstants.page.value),
          child: const _FriendRequests(),
        ),
      ),
    );
  }
}

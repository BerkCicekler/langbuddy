import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:langbuddy/product/bloc/notification_bloc/notification_bloc.dart';
import 'package:langbuddy/product/manager/friend_manager.dart';

@RoutePage()
final class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationBloc(friendManager: GetIt.I<FriendManager>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        body: SizedBox(),
      ),
    );
  }
}

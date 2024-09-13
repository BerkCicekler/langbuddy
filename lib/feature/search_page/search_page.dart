import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langbuddy/product/bloc/search_cubit/search_cubit.dart';
import 'package:langbuddy/product/constants/enums/padding_enums.dart';
import 'package:langbuddy/product/models/friend.dart';
import 'package:langbuddy/product/services/friend_service.dart';

part 'widgets/searched_users.dart';

@RoutePage()
final class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          SearchCubit(friendService: FriendService())..searchFriend(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(PaddingConstants.page.value),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Find Langbuddy',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const _SearchedUsers(),
            ],
          ),
        ),
      ),
    );
  }
}

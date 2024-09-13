part of '../search_page.dart';

final class _SearchedUsers extends StatelessWidget {
  const _SearchedUsers();

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator(
          onRefresh: searchCubit.searchFriend,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: const _SearchBuilder(),
            ),
          ),
        ),
      ),
    );
  }
}

final class _SearchBuilder extends StatelessWidget {
  const _SearchBuilder();

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        switch (state.state) {
          case SearchStateEnum.initial:
            return const Text('initial');
          case SearchStateEnum.loading:
            return const SizedBox.shrink();
          case SearchStateEnum.loaded:
            if (state.users.isEmpty) {
              return const Center(
                child: Text("couldn't find matching user"),
              );
            }
            final users = <Widget>[];
            for (final friend in state.users) {
              users.add(_friendListTile(friend, searchCubit));
            }
            return Column(
              children: users,
            );
          default:
            return const Text('error');
        }
      },
    );
  }

  ListTile _friendListTile(Friend friend, SearchCubit cubit) {
    final alreadyAdded = cubit.state.sendedFriendRequest.contains(friend);

    return ListTile(
      contentPadding: const EdgeInsets.only(top: 7, bottom: 7),
      leading: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/photos/profile_picture.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(friend.userName),
      trailing: IconButton(
        onPressed: alreadyAdded
            ? null
            : () {
                cubit.sendFriendRequest(friend);
              },
        icon: Icon(alreadyAdded ? Icons.mark_email_read_outlined : Icons.add),
      ),
    );
  }
}

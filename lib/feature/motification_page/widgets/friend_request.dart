part of '../notification_page.dart';

final class _FriendRequests extends StatelessWidget {
  const _FriendRequests();

  @override
  Widget build(BuildContext context) {
    final notificationBloc = context.watch<NotificationBloc>();
    return RefreshIndicator(
      onRefresh: () async {
        notificationBloc.add(NotificationRefreshEvent());
      },
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state.state == NotificationStateEnum.loaded) {
            return ListView.builder(
              itemCount: notificationBloc.state.friendRequests.length,
              itemBuilder: (context, index) {
                final currentFriend =
                    notificationBloc.state.friendRequests[index];
                return _friendListTile(currentFriend, notificationBloc);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }

  ListTile _friendListTile(Friend friend, NotificationBloc notificationBloc) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 15, right: 5),
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
      title: Text('${friend.userName} wants to be your friend'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                notificationBloc.add(
                  NotificationFriendRequestAction(
                    targetFriend: friend,
                    action: FriendRequestActions.ACCEPT,
                  ),
                );
              },
              icon: Icon(CupertinoIcons.check_mark)),
          IconButton(
              onPressed: () {
                notificationBloc.add(
                  NotificationFriendRequestAction(
                    targetFriend: friend,
                    action: FriendRequestActions.REJECT,
                  ),
                );
              },
              icon: Icon(CupertinoIcons.xmark)),
        ],
      ),
    );
  }
}

part of '../contacts_page.dart';

class _FriendList extends StatelessWidget {
  const _FriendList({required this.friends});

  final List<Friend> friends;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return _friendListTile(friends[index]);
        },
      ),
    );
  }

  ListTile _friendListTile(Friend friend) {
    return ListTile(
      onTap: () {
        GetIt.I<AppRouter>().push(ChatRoute(friend: friend));
      },
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
    );
  }
}

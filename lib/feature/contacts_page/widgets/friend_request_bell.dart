part of '../contacts_page.dart';

final class _FriendRequestBell extends StatelessWidget {
  const _FriendRequestBell({required this.isNotificationExist});

  final bool isNotificationExist;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Contacts",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Stack(
          children: [
            IconButton(
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.all(0),
              onPressed: () {
                context.router.push(const NotificationRoute());
              },
              icon: const Icon(CupertinoIcons.bell),
              iconSize: 32,
            ),
            !isNotificationExist
                ? const SizedBox.shrink()
                : const Positioned(
                    top: 10,
                    right: 8,
                    child: Icon(
                      Icons.brightness_1,
                      size: 14,
                      color: Colors.redAccent,
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}

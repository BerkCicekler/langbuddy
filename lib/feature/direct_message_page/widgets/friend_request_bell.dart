part of '../direct_message_page.dart';

final class _FriendRequestBell extends StatelessWidget {
  const _FriendRequestBell({required this.isNotificationExist});

  final bool isNotificationExist;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell),
              iconSize: 32,
            ),
            !isNotificationExist
                ? const SizedBox.shrink()
                : const Positioned(
                    top: 10,
                    right: 12,
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

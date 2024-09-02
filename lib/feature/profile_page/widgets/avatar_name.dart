part of '../profile_page.dart';

final class _AvatarAndName extends StatelessWidget {
  const _AvatarAndName({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/photos/profile_picture.jpg'),
          radius: 48,
        ),
        const SizedBox(height: 20),
        Text(
          name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

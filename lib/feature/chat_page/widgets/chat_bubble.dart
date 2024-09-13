part of '../chat_page.dart';

final class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.message, required this.isBelongToClient});

  final bool isBelongToClient;
  final String message;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment:
          isBelongToClient ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: EdgeInsets.only(
            right: PaddingConstants.small.value,
            left: PaddingConstants.small.value,
            top: PaddingConstants.small.value),
        constraints: BoxConstraints(maxWidth: width * .7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isBelongToClient ? Colors.amber[400] : Colors.grey,
        ),
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: .8,
          ),
        ),
      ),
    );
  }
}

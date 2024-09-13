part of '../chat_page.dart';

class _ChatList extends StatelessWidget {
  const _ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final currentMessage = state.messages[index];
              return _ChatBubble(
                isBelongToClient: currentMessage.isClient,
                message: currentMessage.text,
              );
            },
          ),
        );
      },
    );
  }
}

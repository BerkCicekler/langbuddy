import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langbuddy/product/bloc/chat_cubit/chat_cubit.dart';
import 'package:langbuddy/product/constants/enums/padding_enums.dart';
import 'package:langbuddy/product/models/friend.dart';

part 'chat_page_mixin.dart';
part 'widgets/chat_bubble.dart';
part 'widgets/message_text_field.dart';
part 'widgets/chat_list.dart';

@RoutePage()
final class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.friend,
    super.key,
  });

  final Friend friend;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with ChatPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _chatCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.friend.userName),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          buildWhen: (previous, current) => previous.state != current.state,
          builder: (context, state) {
            if (state.state != ChatEnumState.connected) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ChatList(),
                _MessageTextField(),
              ],
            );
          },
        ),
      ),
    );
  }
}

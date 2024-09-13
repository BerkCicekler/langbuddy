part of 'chat_page.dart';

mixin ChatPageMixin on State<ChatPage> {
  late final TextEditingController _messageTextField;
  late final ChatCubit _chatCubit;
  @override
  void initState() {
    super.initState();
    _messageTextField = TextEditingController();
    _chatCubit = ChatCubit(
      friend: widget.friend,
      messageTextField: _messageTextField,
    )..connectToChannel();
  }

  @override
  void dispose() {
    super.dispose();
    _messageTextField.dispose();
  }
}

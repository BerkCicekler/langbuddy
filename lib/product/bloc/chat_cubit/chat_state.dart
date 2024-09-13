import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langbuddy/product/models/message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required List<Message> messages,
    required ChatEnumState state,
  }) = _ChatState;
}

enum ChatEnumState {
  initial,
  connecting,
  connected;
}

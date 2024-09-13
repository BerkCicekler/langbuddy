import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:langbuddy/product/bloc/chat_cubit/chat_state.dart';
import 'package:langbuddy/product/manager/auth_manager.dart';
import 'package:langbuddy/product/models/friend.dart';
import 'package:langbuddy/product/models/message.dart';
import 'package:langbuddy/product/services/chat_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

export 'chat_state.dart';

final class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.friend, required this.messageTextField})
      : super(
          ChatState(
            messages: [],
            state: ChatEnumState.initial,
          ),
        );

  late final WebSocketChannel _channel;
  final TextEditingController messageTextField;
  final Friend friend;
  final _authManager = GetIt.I<AuthManager>();

  void _onDataReceived(dynamic data) {
    final tempMessages = state.messages.toList();
    tempMessages.add(Message(text: data as String, isClient: false));
    emit(state.copyWith(messages: tempMessages));
  }

  Future<void> connectToChannel() async {
    // this variable will help us to connect to right chat channel
    // we give the list our client's id and the friends id
    // and then using it to create chat room id
    emit(state.copyWith(state: ChatEnumState.connecting));
    final tempChannelIds = <int>[_authManager.user.id, friend.id]..sort();
    final chatRoomId =
        "${tempChannelIds[0].toString()}-${tempChannelIds[1].toString()}";
    _channel = ChatService.instance.connectToChat(chatRoomId);
    await _channel.ready;
    emit(state.copyWith(state: ChatEnumState.connected));
    _channel.stream.listen(_onDataReceived);
  }

  void sendMessage() {
    _channel.sink.add(messageTextField.text);
    final tempMessages = state.messages.toList();
    tempMessages.add(Message(text: messageTextField.text, isClient: true));
    messageTextField.clear();
    emit(state.copyWith(messages: tempMessages));
  }
}

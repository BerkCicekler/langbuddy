import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final class ChatService {
  ChatService._();

  static ChatService get instance {
    return _instance ??= ChatService._();
  }

  static ChatService? _instance;

  String _accessToken = '';

  void setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  WebSocketChannel connectToChat(String roomId) {
    final wsUrl = Uri.parse('ws://localhost:8080/api/v1/chat/$roomId');
    final channel = IOWebSocketChannel.connect(
      wsUrl,
      headers: {'Authorization': _accessToken},
    );
    return channel;
  }
}

/// Message model for Chat page
final class Message {
  Message({required this.text, required this.isClient});

  final String text;

  /// is the message belong to client
  final bool isClient;
}

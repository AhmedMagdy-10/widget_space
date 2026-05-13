class ChatMessage {
  final String message;
  final String id;

  ChatMessage(this.message, this.id);

  factory ChatMessage.fromJson(Map<String, dynamic> jsonData) {
    return ChatMessage(jsonData['message'], jsonData['id']);
  }
}

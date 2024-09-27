class Message {
  final String messages;
  final String email;

  Message(this.messages, this.email);
  factory Message.fromJson(jsonData) {
    return Message(jsonData['messages'], jsonData['email']);
  }
}

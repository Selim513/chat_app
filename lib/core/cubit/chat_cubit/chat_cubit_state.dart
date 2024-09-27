import 'package:chat_app/core/model/model_message.dart';

class ChatState {}

class ChatInitialState extends ChatState {}

class ChatSuccessState extends ChatState {
  final List<Message> messages;

  ChatSuccessState({required this.messages});
}

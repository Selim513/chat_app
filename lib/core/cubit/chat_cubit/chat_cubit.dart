import 'package:chat_app/core/cubit/chat_cubit/chat_cubit_state.dart';
import 'package:chat_app/core/model/model_message.dart';
import 'package:chat_app/core/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());
  CollectionReference reference = FirebaseFirestore.instance
      .collection(GetFirebaseCollections.kMessagesCollection);

  void sendMessages({required String messages, required String? email}) {
    try {
      reference.add({
        'messages': messages,
        'message time': DateTime.now(),
        'email': GetFirebaseCollections.user!.email
      });
    } catch (e) {
      print(e);
    }
  }

  void getMessages() {
    reference.orderBy('message time', descending: true).snapshots().listen(
      (event) {
        List<Message> messageList = [];
        for (var doc in event.docs) {
          print('===========> doc:${event.docs}');
          messageList.add(Message.fromJson(doc));
        }
        emit(ChatSuccessState(messages: messageList));
      },
    );
  }
}

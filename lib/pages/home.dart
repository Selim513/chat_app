import 'package:chat_app/core/Widgets/CustomChatMessageWidget.dart';
import 'package:chat_app/core/Widgets/customTextField(message).dart';
import 'package:chat_app/core/model/model_message.dart';
import 'package:chat_app/core/utils/constant.dart';
import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    CollectionReference messages = FirebaseFirestore.instance
        .collection(GetFirebaseCollections.kMessagesCollection);
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('message time', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              foregroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    GetImages.kPrimaryImage,
                    height: 70,
                  ),
                  Text(
                    'Chat',
                    style: getWhiteFont(),
                  ),
                ],
              ),
              backgroundColor: GetColors.kPrimaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    reverse: true,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      if (messageList[index].email ==
                          GetFirebaseCollections.user!.email) {
                        return CustomChatMessageWidget(
                            message: messageList[index].message);
                      } else {
                        return CustomChatMessageFriendWidget(
                            message: messageList[index].message);
                      }
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10, top: 15, left: 10, right: 10),
                    child: CustomtextField(
                      messageController: controller,
                      onSubmited: (value) {
                        messages.add({
                          'message': value,
                          'message time': DateTime.now(),
                          'email': GetFirebaseCollections.user!.email
                        });
                        listViewController();

                        controller.clear();
                      },
                    ))
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erorr Loading..'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void listViewController() {
    _controller.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}

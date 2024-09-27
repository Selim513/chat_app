import 'package:chat_app/core/Widgets/CustomChatMessageWidget.dart';
import 'package:chat_app/core/Widgets/customTextField(message).dart';
import 'package:chat_app/core/cubit/chat_cubit/chat_cubit.dart';
import 'package:chat_app/core/cubit/chat_cubit/chat_cubit_state.dart';
import 'package:chat_app/core/model/model_message.dart';
import 'package:chat_app/core/utils/constant.dart';
import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  List<Message> messageList = [];
  @override
  Widget build(BuildContext context) {
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
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccessState) {
                  messageList = state.messages;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  controller: _controller,
                  reverse: true,
                  itemCount: messageList.length,
                  itemBuilder: (context, index) {
                    if (messageList[index].email ==
                        GetFirebaseCollections.user!.email) {
                      return CustomChatMessageWidget(
                          message: messageList[index].messages);
                    } else {
                      return CustomChatMessageFriendWidget(
                          message: messageList[index].messages);
                    }
                  },
                );
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, top: 15, left: 10, right: 10),
              child: CustomtextField(
                messageController: controller,
                onSubmited: (value) {
                  BlocProvider.of<ChatCubit>(context).sendMessages(
                      messages: value,
                      email: GetFirebaseCollections.user!.email);
                  listViewController();

                  controller.clear();
                },
              ))
        ],
      ),
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

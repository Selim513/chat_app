import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:flutter/material.dart';

class CustomChatMessageWidget extends StatelessWidget {
  const CustomChatMessageWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color(0xffff102a43),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * 0.7),
                  child: Text(
                    message,
                    style: getWhiteFont(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomChatMessageFriendWidget extends StatelessWidget {
  const CustomChatMessageFriendWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10, right: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            color: Color(0Xff006D84),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: constraints.maxWidth * 0.7),
                child: Text(
                  message,
                  style: getWhiteFont(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

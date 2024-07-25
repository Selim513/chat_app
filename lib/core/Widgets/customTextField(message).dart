import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  CustomtextField(
      {this.onTap, this.onSubmited, super.key, this.messageController});
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final TextEditingController? messageController;
  final void Function(String)? onSubmited;
  final void Function(dynamic)? onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: messageController,
      onSubmitted: onSubmited,
      decoration: InputDecoration(
        hintText: 'Send Message',
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xffff102a43), width: 2)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xffff102a43), width: 2)),
        suffixIcon: GestureDetector(
            onTap: onTap.toString, child: const Icon(Icons.send)),
      ),
    );
  }
}

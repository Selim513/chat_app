import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.text, this.onpress,
  });
  final String text;
  final void Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black),
        onPressed: onpress,
        child: Text(
          text,
          style: getBlackFont(),
        ));
  }
}

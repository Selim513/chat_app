import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:flutter/material.dart';
 
 showLoadingDialog(BuildContext context) {
  showDialog(
    
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Row(
          children: [
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Text(
              "Loading...",
              style: getWhiteFont(),
            ),
          ],
        ),
      )
      ;
    },
  );
}

import 'package:chat_app/core/utils/fontStyle.dart';
import 'package:flutter/material.dart';

snackBarSuccessMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        style: getWhiteFont(),
      )));
}

snackBarErrorMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        style: getWhiteFont(),
      )));
}

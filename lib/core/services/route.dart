import 'package:flutter/material.dart';

GotoPush(Widget screen, context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));
}

GotoPushReplacement(Widget screen, context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));
}

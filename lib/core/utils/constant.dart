import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetColors {
  static Color kPrimaryColor = const Color(0xff2B475E);
}

class GetImages {
  static String kPrimaryImage = 'assets/image/scholar.png';
}

class GetFirebaseCollections {
  static String kMessagesCollection = 'messages';
  static User? user = FirebaseAuth.instance.currentUser;
}

import 'package:chatbox/model/consts/firebase_consts.dart';
import 'package:chatbox/view/bottom_nav.dart';
import 'package:chatbox/view/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  var isUser = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        setState(() {
          isUser = false;
        });
      } else {
        isUser = true;
      }

      if (kDebugMode) {
        print("User value is $isUser");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return isUser ? BottomNavScreen() : OnboardingScreen();
  }
}

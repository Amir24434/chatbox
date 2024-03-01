import 'package:chatbox/model/consts/firebase_consts.dart';
import 'package:chatbox/view/bottom_nav.dart';
import 'package:chatbox/view/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInCOntroller extends GetxController {
  //text controllers
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordControoler = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.

    emailController.dispose();
    passwordControoler.dispose();
    super.dispose();
  }

  signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordControoler.text,
      );
      credential;
      Get.to(() => const BottomNavScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  signOut() async {
    await auth.signOut();
    Get.offAll(() => const SignInScreen());
  }
}

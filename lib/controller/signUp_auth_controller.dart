// ignore_for_file: unused_element

import 'package:chatbox/model/consts/firebase_consts.dart';
import 'package:chatbox/view/bottom_nav.dart';
import 'package:chatbox/view/otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpController extends GetxController {
  //text controllers

  var formKey = GlobalKey<FormState>();

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());
  String otp = '';
  EmailOTP myauth = EmailOTP();
  RxBool isUser = false.obs;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  //variables
  var isOtpSent = false.obs;

  //sendOtp method
  Future<UserCredential?> signUp(context) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      credential;
      String id = auth.currentUser!.uid;
      String user = usernameController.text.toString();
      if (user.isNotEmpty) {
        //store user into database
        DocumentReference store =
            firebaseFirestore.collection(collectionUser).doc(id);
        await store.set(
          {
            'id': id,
            "name": user,
            "email": emailController.text.toString(),
            //adding 2 empty fields
            "about": "",
            "image_url": "",
            "phone": "",
          },
        );
      }

      Get.offAll(() => const BottomNavScreen());
      VxToast.show(context, msg: "Logged In");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }

  sendOtp(context) async {
    if (passwordController.text != confirmPasswordController.text) {
      VxToast.show(context, msg: "Password mismatched");
    } else {
      try {
        myauth.setConfig(
          appEmail: "chatbox.project1@gmail.com",
          appName: "ChatBox",
          userEmail: emailController.text,
          otpLength: 6,
          otpType: OTPType.digitsOnly,
        );
        if (await myauth.sendOTP() == true) {
          // Get.snackbar("Success", "OTP has been sent");
          VxToast.show(context, msg: "OTP has been sent");

          Get.to(() => const OtpScreen());
        } else {
          //Get.snackbar("Failed", "Oops, OTP sedd failed");
          VxToast.show(context, msg: "Oops, OTP send failed");
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }

  verifyOtp(context) async {
    for (var i = 0; i < otpController.length; i++) {
      otp += otpController[i].text;
    }
    if (await myauth.verifyOTP(otp: otp.toString()) == true) {
      //Get.snackbar("Success", "OTP is verified");
      VxToast.show(context, msg: "OTP is verified");

      signUp(context);
    } else {
      //Get.snackbar("Failed", "Invalid OTP");
      VxToast.show(context, msg: "Invalid OTP");

      if (kDebugMode) {
        print("An error occured!");
      }
    }
  }

  // void checkUser() {
  //   auth.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       isUser.value = false;
  //     } else {
  //       isUser.value = true;
  //     }

  //     if (kDebugMode) {
  //       print("User value is ${isUser.value}");
  //     }
  //   });
  // }
}

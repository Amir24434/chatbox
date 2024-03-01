import 'package:chatbox/controller/home_controller.dart';
import 'package:chatbox/model/consts/firebase_consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  dynamic chatId;
  var userId = currentUser!.uid;

  var friendId = '';
  var username =
      HomeController.instance.prefs.getStringList("user_details")![0];
  var friendname = '';
  var messageController = TextEditingController();
}

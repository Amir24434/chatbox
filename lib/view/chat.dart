import 'package:chatbox/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: Text("''\n"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text("Hello"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text("Hi"),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Icon(Icons.attachment_outlined),
                  SizedBox(
                    child: TextField(
                      decoration:
                          InputDecoration(suffixIcon: Icon(Icons.copy_sharp)),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      Icon(Icons.keyboard_voice_outlined),
                    ],
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Icon(Icons.attachment_outlined),
                  SizedBox(
                    child: TextField(
                      decoration:
                          InputDecoration(suffixIcon: Icon(Icons.copy_sharp)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:chatbox/controller/home_controller.dart';
import 'package:chatbox/controller/signIn_auth_controller.dart';
import 'package:chatbox/view/compose_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(
            () => ComposeScreen(),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Update the UI based on the drawer selection
                // For example, you could navigate to another page
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Update the UI based on the drawer selection
                // For example, you could navigate to another page
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Chats",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  //height: MediaQuery.of(context).size.height * 0.696992,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(
                        25.0,
                      ),
                    ),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CircleAvatar(),
                          Text("Alex Linderson"),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(),
                          Text("Alex Linderson"),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(),
                          Text("Alex Linderson"),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(),
                          Text("Alex Linderson"),
                        ],
                      ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       controller.signOut();
                      //     },
                      //     child: Text("Log Out"))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chatbox/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Container(
                  //color: Colors.deepPurple,
                  child: Center(
                      child: Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  )),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.77,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(
                      25.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.02,
                    right: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: ListTile(
                          leading: Icon(Icons.person_2_outlined),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name"),
                              Text("Description"),
                            ],
                          ),
                          trailing: Icon(Icons.qr_code_scanner),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ProfileScreen());
                        },
                        child: ListTile(
                          leading: Icon(Icons.account_box_outlined),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Profile"),
                              // Text("Description"),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Friends"),
                            //  Text("Description"),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.notifications),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Notifications"),
                            //Text("Description"),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.storage_rounded),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Data and Storage"),
                            // Text("Description"),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Help"),
                            //  Text("Description"),
                          ],
                        ),
                      ),
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

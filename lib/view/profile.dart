import 'dart:io';

import 'package:chatbox/Services/store_services.dart';
import 'package:chatbox/controller/profile_controller.dart';
import 'package:chatbox/model/consts/firebase_consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final currentUser = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Profile"),
        automaticallyImplyLeading: true,
        actions: [
          TextButton(
            onPressed: () async {
              if (controller.imgPath.isEmpty) {
                controller.updateProfile(context);
              } else {
                await controller.uploadImage();
                controller.updateProfile(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: StoreServices.getUser(currentUser?.uid ?? ""),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //if data is loaded show the widget
            if (snapshot.hasData) {
              //setting snapshot into a variable for each access
              //here doc[0] because it will contain only one document
              var data = snapshot.data!.docs[0];

              //setting values to the text controllers
              controller.nameController.text = data["name"];
              controller.aboutController.text = data["about"];
              controller.phoneController.text = data["phone"];
              return Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Obx(
                          () => CircleAvatar(
                            child: controller.imgPath.isEmpty
                                ? Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey[500],
                                  )
                                : controller.imgPath.isNotEmpty
                                    ? Image.file(
                                        File(
                                          controller.imgPath.value,
                                        ),
                                      )
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make()
                                    : Image.network(data["imgae_url"])
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make(),
                            radius: 50,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 17,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[600],
                          ).onTap(() {
                            _showBottomSheet(context, controller);
                          }),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: TextFormField(
                      controller: controller.nameController,
                      decoration: InputDecoration(
                        label: "Name".text.make(),
                        suffixIcon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: TextFormField(
                      controller: controller.aboutController,
                      decoration: InputDecoration(
                        label: "About".text.make(),
                        suffixIcon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: TextFormField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        label: "Phone".text.make(),
                        suffixIcon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              //if data is not loaded yet
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Colors.deepPurple,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, controller) {
    final controller = Get.put(ProfileController());

    var listTile = ["Camera", "Gallery", "Cancel"];
    var icons = [Icons.camera_alt, Icons.image, Icons.cancel_outlined];
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  child: ListTile(
                    onTap: () {
                      //setting ontap according to index
                      switch (index) {
                        //ontap of camera
                        case 0:
                          Get.back();
                          controller.pickImage(context, ImageSource.camera);
                          break;
                        //ontap of gallery
                        case 1:
                          Get.back();
                          controller.pickImage(context, ImageSource.gallery);
                          break;
                        //ontap of cancel
                        case 2:
                          Get.back();
                          break;
                      }
                    },
                    title: listTile[index].text.make(),
                    leading: Icon(icons[index]),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

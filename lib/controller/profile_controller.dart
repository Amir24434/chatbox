// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'dart:io';

import 'package:chatbox/model/consts/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';
import "package:path/path.dart";

//update profile methodAssuming you're using VxToast for showing toast messages

class ProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final String collectionUser = 'users';

  //variables for image
  var imgPath = ''.obs;
  var imgLink = '';

  Future<void> updateProfile(BuildContext context) async {
    // ignore: duplicate_ignore, duplicate_ignore
    try {
      // Check if user is logged in
      if (auth.currentUser == null) {
        throw Exception("User not logged in");
      }

      // Reference to the user's document in Firestore
      var store = firebaseFirestore
          .collection(collectionUser)
          .doc(auth.currentUser!.uid);

      // Update user data
      await store.set({
        "name": nameController.text,
        "about": aboutController.text,
        "phone": phoneController.text,
        "image_url": imgLink,
      }, SetOptions(merge: true));

      // Show success message
      // ignore: use_build_context_synchronously
      VxToast.show(context, msg: "Profile updated successfully");
    } catch (error) {
      // Handle errors
      if (kDebugMode) {
        print("Error updating profile: $error");
      }
      VxToast.show(context,
          msg: "Failed to update profile. Please try again later.");
    }
  }

  //image picking method

  pickImage(context, ImageSource source) async {
    //get permissinon form user
    await Permission.photos.request();
    await Permission.camera.request();

    //gettng state of our permission to handle

    //var status = await Permission.photos.status;

    var photosPermission = await Permission.photos.request();
    var cameraPermission = await Permission.camera.request();

    // Check if both permissions are granted
    if (photosPermission.isGranted && cameraPermission.isGranted) {
      try {
        // Pick image based on the source
        final img = await ImagePicker().pickImage(
          source: source,
          imageQuality: 80,
        );

        // Check if image is picked
        if (img != null) {
          // Update the image path
          imgPath.value = img.path;
          VxToast.show(context, msg: "Image selected");
        } else {
          VxToast.show(context, msg: "No image selected");
        }
      } catch (e) {
        VxToast.show(context, msg: "Error picking image: $e");
      }
    } else {
      VxToast.show(context, msg: "Permission Denied");
    }
  }

  uploadImage() async {
    var name = basename(imgPath.value);
    var destination = "images/${currentUser!.uid}/$name";

    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(imgPath.value));

    var d = await ref.getDownloadURL();
    imgLink = d;
  }
}

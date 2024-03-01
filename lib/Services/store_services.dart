import 'package:chatbox/model/consts/firebase_consts.dart';
import 'package:flutter/foundation.dart';

class StoreServices {
//get user data
  static getUser(String id) {
    return firebaseFirestore
        .collection(collectionUser)
        .where("id", isEqualTo: id)
        .get();
  }

  static getAllUsers() {
    return firebaseFirestore.collection(collectionUser).snapshots();
  }
}

// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  getUserByUsername(String username) async
  {
    return await FirebaseFirestore.instance.collection("users")
        .where("name", isEqualTo: username ).snapshots();
  }

  getUserByUserEmail(String userEmail) async
  {
    return await FirebaseFirestore.instance.collection("users")
          .where("email", isEqualTo: userEmail ).snapshots();
  }

  getUserByUserPassword(String userpassword) async
  {
    return await FirebaseFirestore.instance.collection("users")
        .where("password", isEqualTo: userpassword ).snapshots();
  }

  uploadUserInfo(userMap){
   FirebaseFirestore.instance.collection("users")
       .add(userMap);
  }

}
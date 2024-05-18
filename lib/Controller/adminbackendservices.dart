import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../View/Modules/Admin/bottombar.dart';

class AdminBackend extends ChangeNotifier  {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

   var adminemailcontroller =TextEditingController();
   var adminpasswordcontroller =TextEditingController();
   
   final adminuid = "DJ69sMdTjCXteVCBygsdLtmJixg2";

  checkadminemail(context) {
    _firebaseAuth
        .signInWithEmailAndPassword(
        email: adminemailcontroller.text,
        password: adminpasswordcontroller.text)
        .then((credential) {
      if (credential.user!.uid == adminuid) {
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BottomBarrr(),
            ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.blue,
              animation: AlwaysStoppedAnimation(BorderSide.strokeAlignOutside),
              content: Text("Registered Successfully")),
        );

                
      } else {
        _firebaseAuth.signOut();
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email and Password is Doesn't match")));
      }
    }).onError((error, stackTrace) {
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email and Password is Doesn't Match")));
    });
  }




  File? images;

  File? get image => images;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      images = File(pickedImage.path);
    } else {
      images = null;
    }
    notifyListeners();
  }
}
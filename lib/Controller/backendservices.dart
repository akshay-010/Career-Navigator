import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:careernavigator/View/Modules/Users/bottombar.dart';
import 'package:careernavigator/View/Modules/Users/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../Model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../Model/usermodel.dart';

class BackendServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  UserModel? _userModel;

  UserModel get userModel => _userModel!;

  Future<void> saveUser(String userId, String email) async {
    final userDoc = _firebaseFirestore.collection("user").doc(userId);
    _userModel = UserModel(
      userid: userId,
      email: email,
    );
    await userDoc.set(_userModel!.toMap());
  }

  Future<void> signUp(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = _firebaseAuth.currentUser;
      // await
       user?.sendEmailVerification();
      await saveUser(user!.uid, email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign-up successful! Please check your email for verification.")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
      print(e);
    }
  }


  Future<void>login(String username,String password,context ) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: username, password: password);
      final shoper = _firebaseAuth.currentUser;
      final emailverified = shoper!.emailVerified;
      if (emailverified == false) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please verify your email")));
      } else {
        print('Userid${shoper.uid}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Registration_Page()));
      }
    }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

    }catch(e){
      print(e);
    }
  }


  // Future<void> login(String email, String password, BuildContext context) async {
  //   try {
  //     UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     final user = _firebaseAuth.currentUser;
  //
  //     if (user != null && user.emailVerified) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration_Page()));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Email not verified. Please verify your email!"))
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Error: ${e.toString()}"))
  //     );
  //     print(e);
  //   }
  // }

}


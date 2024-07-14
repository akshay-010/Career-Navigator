import 'dart:io';
import 'dart:typed_data';
import 'package:another_flushbar/flushbar.dart';
import 'package:careernavigator/View/Modules/Users/bottombar.dart';
import 'package:careernavigator/View/Modules/Users/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../Model/usermodel.dart';
import '../View/Modules/Users/loginpage.dart';

class BackendServices extends ChangeNotifier{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  UserModel? _userModel;

  UserModel get userModel => _userModel!;

  Future<void> saveUser(String userId, String email) async {
    final userDoc = _firebaseFirestore.collection("User").doc(userId);
    _userModel = UserModel(
      userid: userId,
      email: email,
    );
    await userDoc.set(_userModel!.toMap());
  }

  Future<void> signUp(String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth
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


  Future<void>login(String email,String password,context ) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password).then((value){
            print(value);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomBar()));
      });
    }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

    }catch(e){
      print(e);
    }
  }


  Future<void> addRegistration(
      String Name,
      String Qualification,
      String Gender,
      String emaill,
      String Number,

      String UserId
      ) async {
    try {
      final user = _firebaseAuth.currentUser;
      UserRegistration userRegistration = UserRegistration(
        userid: user!.uid,
        Name: Name,
        Qualification: Qualification,
        Gender: Gender,
        emaill: emaill,
        Number: Number,

      );
      await _firebaseFirestore
          .collection('User')
          .doc('AllRegistrations')
          .collection("Registration")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userRegistration.toMap());
      print('*Institution Stored');
    } catch (e) {
      print("Institution storing failed: $e");
    }
    notifyListeners();
  }




             //Latest fetch registration

  Future<UserRegistration?> getCurrentUserRegistration() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await _firebaseFirestore
            .collection('User')
            .doc('AllRegistrations')
            .collection("Registration")
            .doc(user.uid)
            .get();

        if (doc.exists) {
          return UserRegistration.fromMap(doc.data() as Map<String, dynamic>);
        }
      }
    } catch (e) {
      print("Fetching user registration details failed: $e");
    }
    return null;
  }





  //
  //

  Future<List<UserRegistration>> fetchRegistrations() async {
    List<UserRegistration> registrations = [];
    try {
      final user = _firebaseAuth.currentUser;
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .doc('AllRegistrations')
          .collection("Registration")
          .get();

      querySnapshot.docs.forEach((doc) {
        registrations.add(UserRegistration(
          userid: doc['userid'],
          Name: doc['Name'],
          Qualification: doc['Qualification'],
          Gender: doc['Gender'],
          emaill: doc['emaill'],
          Number: doc['Number'],
          imageUrl: doc['imageUrl'],
        ));
      });
    } catch (e) {
      print("Error fetching registrations: $e");
    }
    return registrations;
  }


  //
  //
  // Future<List<UserRegistration>> fetchRegistrationsProfile() async {
  //   List<UserRegistration> registrations = [];
  //
  //   try {
  //     QuerySnapshot querySnapshot = await _firebaseFirestore
  //         .collection('User')
  //         .doc('AllRegistrations')
  //         .collection("Registration")
  //         .get();
  //
  //     querySnapshot.docs.forEach((doc) {
  //       // Make sure to check for null or missing fields
  //       UserRegistration registration = UserRegistration(
  //         userid: doc['userid'] ?? '', // Replace '' with default value if necessary
  //         Name: doc['Name'] ?? '', // Replace '' with default value if necessary
  //         Qualification: doc['Qualification'] ?? '', // Replace '' with default value if necessary
  //         Gender: doc['Gender'] ?? '', // Replace '' with default value if necessary
  //         emaill: doc['emaill'] ?? '', // Replace '' with default value if necessary
  //         Number: doc['Number'] ?? '', // Replace '' with default value if necessary
  //         imageUrl: doc['imageUrl'] ?? null, // Set imageUrl to null if missing
  //       );
  //
  //       registrations.add(registration);
  //     });
  //
  //     return registrations;
  //   } catch (e) {
  //     print("Failed to fetch registrations: $e");
  //     return [];
  //   }
  // }
  //





  // // Your other methods and properties here
  //
  // Future<void> insertImage(String userId, File? imageFile) async {
  // if (imageFile == null) return; // Return if no image is selected
  //
  // try {
  // // Upload the image to Firebase Storage
  // String fileName = 'profile_image_$userId'; // Unique file name for the image
  // Reference ref = FirebaseStorage.instance.ref().child('profile_images').child(fileName);
  // await ref.putFile(imageFile);
  //
  // // Get the download URL of the uploaded image
  // String imageUrl = await ref.getDownloadURL();
  //
  // // Update the user registration collection in Firestore with the image URL
  // await FirebaseFirestore.instance
  //     .collection('User')
  //     .doc(userId)
  //     .update({'imageUrl': imageUrl});
  //
  // print('Image inserted successfully');
  // } catch (e) {
  // print('Error inserting image: $e');
  // }
  // }








  // Your other methods and properties here

  Future<void> insertImage(String userId, File? imageFile) async {
  if (imageFile == null) return; // Return if no image is selected

  try {
  // Upload the image to Firebase Storage
  String fileName = 'profile_image_$userId'; // Unique file name for the image
  Reference ref = FirebaseStorage.instance.ref().child('profile_images').child(fileName);
  await ref.putFile(imageFile);

  // Get the download URL of the uploaded image
  String imageUrl = await ref.getDownloadURL();

  // Update the user registration collection in Firestore with the image URL
  await FirebaseFirestore.instance
      .collection('User')
      .doc('AllRegistrations')
      .collection('Registration')
      .doc(userId) // Corrected: Use the userId parameter to identify the document
      .update({'imageUrl': imageUrl});

  print('Image inserted successfully');
  } catch (e) {
  print('Error inserting image: $e');
  }

  }





  Future<Map<String,dynamic>?> fetchInstitutionDetails(String ownerId) async {
    try {
      DocumentSnapshot<
          Map<String, dynamic>> documentSnapshot = await FirebaseFirestore
          .instance
          .collection('Admin')
          .doc('ADMIN')
          .collection("counselloradd")
          .doc(ownerId)
          .get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        print('No institution found for ownerId: $ownerId');
        return null;
      }
    } catch (e) {
      print('Error fetching owned institution: $e');
      return null;
    }
  }





  Future<void> logout(BuildContext context) async {
    try {
      await _firebaseAuth.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => logout(context),
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }





}


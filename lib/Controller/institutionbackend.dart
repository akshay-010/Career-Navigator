// import 'dart:developer';
// import 'dart:io';
// import 'package:careernavigator/View/Modules/Institutions/addinstitution.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
//
// import '../Model/institutionmodel.dart';
// import 'Providers/institutionprovider.dart';
// class InstitutionBackend extends ChangeNotifier {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
//
//   InstituionModel? _instituionModel;
//
//   InstituionModel get instituionModel => _instituionModel!;
//
//   Future<void> saveInstitution(String userId, String email) async {
//     final userDoc = _firebaseFirestore.collection("institutions").doc(userId);
//     _instituionModel = InstituionModel(
//       userid: userId,
//       email: email,
//     );
//     await userDoc.set(_instituionModel!.toMap());
//   }
//
//   Future<void> signUp(String email, String password, BuildContext context) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       final user = _firebaseAuth.currentUser;
//       user?.sendEmailVerification();
//       await saveInstitution(user!.uid, email);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Sign-up successful! Please check your email for verification.")),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: ${e.toString()}")),
//       );
//       print(e);
//     }
//   }
//
//   Future<void> loginPage(String email, String password, BuildContext context) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       final user = _firebaseAuth.currentUser;
//       if (user != null && !user.emailVerified) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please verify your email")),
//         );
//       } else {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AddInstitutions()),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString())),
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   File? images;
//
//   File? get image => images;
//
//   Future<void> pickImage(ImageSource source) async {
//     final pickedImage = await ImagePicker().pickImage(source: source);
//     if (pickedImage != null) {
//       images = File(pickedImage.path);
//     } else {
//       images = null;
//     }
//     notifyListeners();
//   }
//
//
//
//
//   Future<void> saveInstitutionDetails({
//     required String name,
//     required String managerName,
//     required String email,
//     required String location,
//     required String phone,
//     required String about,
//     required String imageUrl,
//   }) async {
//     try {
//       final user = _firebaseAuth.currentUser;
//
//       if (user != null) {
//         final institutionDoc = _firebaseFirestore.collection('institutions').doc(user.uid);
//         await institutionDoc.collection('institutiondetails').add({
//           'name': name,
//           'managerName': managerName,
//           'email': email,
//           'location': location,
//           'phone': phone,
//           'about': about,
//           'imageUrl': imageUrl,
//         });
//       } else {
//         throw 'User not authenticated.';
//       }
//     } catch (e) {
//       print('Error saving institution details: $e');
//       throw e;
//     }
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/institutionmodel.dart';
import '../View/Modules/Institutions/addinstitution.dart';

class InstitutionBackend extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  InstituionModel? _instituionModel;

  InstituionModel get instituionModel => _instituionModel!;

  Future<void> saveInstitution(String userId, String email) async {
    final userDoc = _firebaseFirestore.collection("institutions").doc(userId);
    _instituionModel = InstituionModel(
      userid: userId,
      email: email,
    );
    await userDoc.set(_instituionModel!.toMap());
  }

  Future<void> signUp(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = _firebaseAuth.currentUser;
      user?.sendEmailVerification();
      await saveInstitution(user!.uid, email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign-up successful! Please check your email for verification.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
      print(e);
    }
  }






  Future<void> loginPage(String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final user = _firebaseAuth.currentUser;
      final emailVerified = user!.emailVerified;
      if (!emailVerified) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please verify your email")),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddInstitutions()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } catch (e) {
      print(e);
    }
    notifyListeners();
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

  Future<String> uploadImage(File image) async {
    try {
      final user = _firebaseAuth.currentUser;
      final storageRef = _firebaseStorage.ref().child('institution_images/${user!.uid}/${DateTime.now().toIso8601String()}');
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      throw e;
    }
  }

  Future<void> saveInstitutionDetails({
    required String name,
    required String managerName,
    required String email,
    required String location,
    required String phone,
    required String about,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;

      if (user != null) {
        String imageUrl = '';
        if (images != null) {
          imageUrl = await uploadImage(images!);
        }

        final institutionDoc = _firebaseFirestore.collection('institutions').doc(user.uid);
        await institutionDoc.collection('institutiondetails').add({
          'name': name,
          'managerName': managerName,
          'email': email,
          'location': location,
          'phone': phone,
          'about': about,
          'imageUrl': imageUrl,
        });
      } else {
        throw 'User not authenticated.';
      }
    } catch (e) {
      print('Error saving institution details: $e');
      throw e;
    }
  }




  Stream<List<InstitutionDetails>> fetchInstitutionDetails() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return _firebaseFirestore
          .collection('institutions')
          .doc(user.uid)
          .collection('institutiondetails')
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => InstitutionDetails.fromMap(doc.data()))
          .toList());
    } else {
      throw 'User not authenticated.';
    }
  }
}

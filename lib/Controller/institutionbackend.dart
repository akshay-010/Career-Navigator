
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/institutionmodel.dart';
import '../View/Modules/Institutions/addinstitution.dart';

// class InstitutionBackend extends ChangeNotifier {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
//
// }




//
// class AuthServiceee {
//
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
//
// }


// owner_service.dart

class OwnerService extends ChangeNotifier {
  final String ownerId;

  OwnerService({required this.ownerId});

  Future<Map<String, dynamic>?> fetchOwnedInstitution() async {
    try {
      DocumentSnapshot<
          Map<String, dynamic>> documentSnapshot = await FirebaseFirestore
          .instance
          .collection('Admin')
          .doc('ADMIN')
          .collection("institutionadd")
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
  }}














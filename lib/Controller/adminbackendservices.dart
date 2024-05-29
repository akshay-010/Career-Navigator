import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/adminmodel.dart';
import '../View/Modules/Admin/bottombar.dart';

class AdminBackend extends ChangeNotifier  {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;



    //Admin Login

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
        Flushbar(
          message: "Log In Succefully",
          duration: Duration(seconds: 5),
          backgroundColor: Colors.green.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
          margin: EdgeInsets.all(8),
          icon: Icon(
            Icons.done_all,
            size: 28.0,
            color: Colors.white,
          ),
          leftBarIndicatorColor: Colors.blue,
        )..show(context);


      } else {
        _firebaseAuth.signOut();
        return  Flushbar(
          message: "Email and Password is Doesn't match",
          messageColor: Colors.white,
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          margin: EdgeInsets.all(8),
          icon: Icon(
            Icons.error_outline,
            size: 28.0,
            color: Colors.white,
          ),
          leftBarIndicatorColor: Colors.redAccent,
        )..show(context);
      }
    }).onError((error, stackTrace) {
      return Flushbar(
        message: "Invalid email or password",
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(10),
        margin: EdgeInsets.all(8),
        icon: Icon(
          Icons.error_outline,
          size: 28.0,
          color: Colors.white,
        ),
        leftBarIndicatorColor: Colors.redAccent,
      )..show(context);
    });
  }







  TextEditingController counsellornameController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();
  TextEditingController emailllController = TextEditingController();
  TextEditingController ageeeController = TextEditingController();
  TextEditingController locationsController = TextEditingController();
  TextEditingController passworddController = TextEditingController();



  File? _imagess;
  Uint8List? _webImagess;

  File? get imagess => _imagess;
  Uint8List? get webImagess => _webImagess;

  Future<void> pickImageCounsellor(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        if (kIsWeb) {
          _webImagess = await pickedImage.readAsBytes();
        } else {
          _imagess = File(pickedImage.path);
        }
      } else {
        _imagess = null;
        _webImagess = null;
      }
      notifyListeners();
    } catch (e) {
      print("Image picking failed: $e");
      _imagess = null;
      _webImagess = null;
      notifyListeners();
    }
  }


  Future<String> storeImageToCounsellor(String ref) async {
      try {
        SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
        UploadTask uploadTask;

        if (kIsWeb && _webImagess != null) {
          uploadTask = _firebaseStorage.ref().child(ref).putData(_webImagess!, metadata);
        } else if (_imagess != null) {
          uploadTask = _firebaseStorage.ref().child(ref).putFile(_imagess!, metadata);
        } else {
          throw Exception("No image selected");
        }

        TaskSnapshot snapshot = await uploadTask;
        String downloadURL = await snapshot.ref.getDownloadURL();
        log(downloadURL);
        return downloadURL;
      } catch (e) {
        print("Image upload failed: $e");
        rethrow;
      }
    }

  Future<void> addCounsellor(
      String counsellorname,
      String phone,
      String email,
      String age,
      String location,
      String password,
      String imageUrl,

      String credentialId
      ) async {
    try {
      final user = _firebaseAuth.currentUser;
      AdminAddCounsellor adminAddCounsellor = AdminAddCounsellor(
        userId: user!.uid,
        counsellorname: counsellorname,
        phone: phone,
        email: age,
        age: email,
        location: location,
        password: password,
        imageUrl: imageUrl,
      );
      await _firebaseFirestore
          .collection('Admin')
          .doc("ADMIN")
          .collection("counselloradd")
          .doc(credentialId)
          .set(adminAddCounsellor.toMap());
      print('*Institution Stored');
    } catch (e) {
      print("Institution storing failed: $e");
    }
    notifyListeners();
  }





  //fetch institution details


  Stream<List<AdminAddCounsellor>> getCounsellorStream() {
    return _firebaseFirestore
        .collection('Admin')
        .doc('ADMIN')
        .collection('counselloradd')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return AdminAddCounsellor(
          counsellorname: doc['counsellorname'],
          phone: doc['phone'] ?? '',
          email: doc['email'],
          age: doc['age'],
          location: doc['location'] ?? '',
          password: doc['password'] ?? '',
          imageUrl: doc['imageUrl'] ?? '',
          userId: doc['userId'],
        );
      }).toList();
    });
  }











    //Add Admin Institution

  TextEditingController institutionnameController = TextEditingController();
  TextEditingController managernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  File? _image;
  Uint8List? _webImage;

  File? get image => _image;
  Uint8List? get webImage => _webImage;

  Future<void> pickImageInstitution(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        if (kIsWeb) {
          _webImage = await pickedImage.readAsBytes();
        } else {
          _image = File(pickedImage.path);
        }
      } else {
        _image = null;
        _webImage = null;
      }
      notifyListeners();
    } catch (e) {
      print("Image picking failed: $e");
      _image = null;
      _webImage = null;
      notifyListeners();
    }
  }

  Future<String> storeImageToStorage(String ref) async {
    try {
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
      UploadTask uploadTask;

      if (kIsWeb && _webImage != null) {
        uploadTask = _firebaseStorage.ref().child(ref).putData(_webImage!, metadata);
      } else if (_image != null) {
        uploadTask = _firebaseStorage.ref().child(ref).putFile(_image!, metadata);
      } else {
        throw Exception("No image selected");
      }

      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      log(downloadURL);
      return downloadURL;
    } catch (e) {
      print("Image upload failed: $e");
      rethrow;
    }
  }

  Future<void> addInstitution(
      String institutionname,
      String managername,
      String email,
      String phone,
      String location,
      String password,
      String imageUrl,

      String credentialId
      ) async {
    try {
      final user = _firebaseAuth.currentUser;
      AdminAddInstitution adminAddInstitution = AdminAddInstitution(
        userId: user!.uid,
        institutionname: institutionname,
        managername: managername,
        email: email,
        phone: phone,
        location: location,
        password: password,
        imageUrl: imageUrl,
      );
      await _firebaseFirestore
          .collection('Admin')
          .doc("ADMIN")
          .collection("institutionadd")
          .doc(credentialId)
          .set(adminAddInstitution.toMap());
      print('*Institution Stored');
    } catch (e) {
      print("Institution storing failed: $e");
    }
    notifyListeners();
  }





     //fetch institution details


  Stream<List<AdminAddInstitution>> getInstitutionsStream() {
    return _firebaseFirestore
        .collection('Admin')
        .doc('ADMIN')
        .collection('institutionadd')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return AdminAddInstitution(
          institutionname: doc['institutionname'],
          managername: doc['managername'] ?? '',
          email: doc['email'],
          phone: doc['phone'],
          location: doc['location'] ?? '',
          password: doc['password'] ?? '',
          imageUrl: doc['imageUrl'] ?? '',
          userId: doc['userId'],
        );
      }).toList();
    });
  }








  TextEditingController examnameController = TextEditingController();
  TextEditingController aboutexamController = TextEditingController();


  Future<void> addEntreaneExam(
      String examname,
      String examabout,

      ) async {
    try {
      final user = _firebaseAuth.currentUser;
      AdmEntrance admEntrance = AdmEntrance(
        userId: user!.uid,
        examname: examname,
        examabout: examabout,

      );
      await _firebaseFirestore
          .collection('Admin')
          .doc("ADMIN")
          .collection("entranceexam")
          .doc(user.uid)
          .set(admEntrance.toMap());
      print('*Institution Stored');
    } catch (e) {
      print("Institution storing failed: $e");
    }
    notifyListeners();
  }





  Future<List<AdmEntrance>> fetchEntranceExam() async {
    try {
      final user = _firebaseAuth.currentUser;
      QuerySnapshot querySnapshot = await _firebaseFirestore
          .collection('Admin')
          .doc("ADMIN")
          .collection("entranceexam")
          .where( user!.uid)
          .get();

      List<AdmEntrance> entranceExams = querySnapshot.docs.map((doc) {
        return AdmEntrance.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return entranceExams;
    } catch (e) {
      print("Failed to fetch entrance exams: $e");
      return [];
    }
  }



}











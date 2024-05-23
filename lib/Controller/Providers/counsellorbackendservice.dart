import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../Model/adminmodel.dart';
import '../../View/Modules/Counsellors/appointment.dart';
import '../../View/Modules/Counsellors/feedback.dart';
import '../../View/Modules/Counsellors/notifications.dart';
import '../../View/Modules/Counsellors/profile.dart';
import '../../View/Modules/Counsellors/reporting.dart';

class CounsellorService extends ChangeNotifier{
  var indexNumber = 0;
  List bott = [
    ProfilePage(),
    Appointments(),
    FeedBack(),
    Notificationss(),
    Reporting()
  ];
  void bottom(int index) {
    indexNumber = index;
    notifyListeners();
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







 //  AdminAddCounsellor? adminAddCounsellor;
 //  String?  userId;
 //  String?counsellorname;
 //  String? imageUrl;
 // fetchOwnedInstitution() async {
 //   final snapshot =await FirebaseFirestore.instance
 //   .collection("Admin")
 //   .doc('ADMIN')
 //   .collection("counselloradd")
 //   .doc(FirebaseAuth.instance.currentUser!.uid)
 //   .get();
 //
 //   if (snapshot.exists){
 //     adminAddCounsellor=AdminAddCounsellor.fromMap(snapshot.data()!);
 //     userId =adminAddCounsellor!.userId;
 //     counsellorname = adminAddCounsellor!.counsellorname;
 //     imageUrl =adminAddCounsellor!.imageUrl;
 //
 //  }}


}



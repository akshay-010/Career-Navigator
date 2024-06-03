import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class Notificationss extends StatefulWidget {
  const Notificationss({super.key});

  @override
  State<Notificationss> createState() => _NotificationssState();
}

class _NotificationssState extends State<Notificationss> {
  @override
  Widget build(BuildContext context) {


    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text('No user logged in'),
        ),
      );
    }
    final String ownerId = user.uid;


    Future<List<Map<String, dynamic>>> fetchCounselorRequests(String counselorId) async {
      try {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
            .instance
            .collection('Admin')
            .doc('ADMIN')
            .collection('counselloradd')
            .doc(ownerId)
            .collection('requests')
            .orderBy('timestamp', descending: true)
            .get();

        return querySnapshot.docs.map((doc) => doc.data()).toList();
      } catch (e) {
        print('Error fetching counselor requests: $e');
        return [];
      }
    }





    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Notificationss",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchCounselorRequests(ownerId),
            builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(
    child: CircularProgressIndicator(),
    );
    } else if (snapshot.hasError) {
    return Center(
    child: Text('Error: ${snapshot.error}'),
    );
    } else {
    List<Map<String, dynamic>> requests = snapshot.data ?? [];
              return ListView.builder(
                itemCount:  requests.length,
                itemBuilder: (context,index){
                  Map<String, dynamic> request = requests[index];

                  return
                    Padding(
                      padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(request['image']),
                        ),
                        title:  Text(request['username'],style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily,fontSize: 13,color: Colors.black,fontWeight: FontWeight.w800)),

                        subtitle: Text(request['message'],style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 13,color: Colors.black,overflow: TextOverflow.ellipsis)),
                        trailing: Text("9.56 AM",style: TextStyle(color: Colors.black,fontFamily: GoogleFonts.poppins().fontFamily,fontSize: 12),),
                      ),
                    );
                }


              );
            }}
          ),
        ),
      ),
    );
  }
}

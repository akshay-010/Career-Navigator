import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'homelistcourses.dart';
class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Notification",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:22),),
      ),
      body: ListView.builder(itemCount: notificationn.length,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(top: 25,right: 10,bottom: 10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(notificationn[index]['profile']),
            ),
            title: Text(notificationn[index]['msg'],style: TextStyle(fontSize: 12),),
            trailing: Padding(
              padding: const EdgeInsets.only(left: 03),
              child: Text(notificationn[index]['timee'],style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w600),),
            ),
          ),
        );
      }),
    );
  }
}

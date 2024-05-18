import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'homelistcourses.dart';
class Popular_Course extends StatefulWidget {
  const Popular_Course({super.key});

  @override
  State<Popular_Course> createState() => _Popular_CourseState();
}

class _Popular_CourseState extends State<Popular_Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Courses",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:22),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),
          Align(
              alignment: Alignment.center,
              child: Text("Popular Courses",style: GoogleFonts.poppins(color:Colors.black,fontSize:20,fontWeight: FontWeight.w700),)),
            Expanded(
              child: ListView.builder(
                itemCount: popularcourses.length,
                itemBuilder: (context,index){
                  return
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: ListTile(
                    leading: Image.asset(popularcourses[index]['logo']),
                     title: Padding(
                       padding: const EdgeInsets.only(left: 5),
                       child: Text(popularcourses[index]['course'],style: GoogleFonts.poppins(color:Colors.black,fontSize:18,fontWeight :FontWeight.w500),),
                     ),
                                 ),
                 );}
              ),
            )
        
        ],),
      ),
    );
  }
}

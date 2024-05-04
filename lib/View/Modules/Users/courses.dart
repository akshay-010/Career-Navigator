import 'package:careernavigator/View/Modules/Users/homelistcourses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class Courses_Page extends StatefulWidget {
  const Courses_Page({super.key});

  @override
  State<Courses_Page> createState() => _Courses_PageState();
}

class _Courses_PageState extends State<Courses_Page> {
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Courses",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),),
      ),
      body: Container(
        height: double.infinity,width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: courses.length,itemBuilder: (context,index){
          return Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: UnconstrainedBox(
                child: Container(
                  height: height*0.1,width: width/2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: HexColor("#A527BC")
                  ),
                  child: Center(
                    child: ListTile(
                      leading:  Text( courses[index]['department'],style: GoogleFonts.roboto(color:Colors.white,fontSize:15),),
                      trailing: Image.asset("assets/bar-chart-grouped-fill.png"),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      )
    );
  }
}

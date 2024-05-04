import 'package:careernavigator/View/Modules/Users/counsellors.dart';
import 'package:careernavigator/View/Modules/Users/entranceexam.dart';
import 'package:careernavigator/View/Modules/Users/institutions.dart';
import 'package:careernavigator/View/Modules/Users/scholarship.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Help",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:22),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: height*0.53,width: width*0.20,
            //   child: CircleAvatar(
            //     minRadius: 30,
            //     backgroundImage: AssetImage("assets/Mask group (1).png"),
            //   )
            // )
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Scholarship_Page()));
              },
              child: Row(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: const BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage("assets/Mask group (1).png"))),
                  ),const SizedBox(width: 30,),
                   Text("Scholarship",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const InstitutionsPage()));
              },
              child: Row(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: const BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage("assets/Mask group (2).png"))),
                  ),const SizedBox(width: 30,),
                   Text("Institutions",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily))
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Counsellors()));
              },
              child: Row(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: const BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage("assets/Mask group (3).png"))),
                  ),const SizedBox(width: 30,),
                   Text("Counsellors",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily))
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const EntranceExam()));
              },
              child: Row(
                children: [
                  Container(
                    height: 100,width: 100,
                    decoration: const BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: AssetImage("assets/Mask group (4).png"))),
                  ),const SizedBox(width: 30,),
                   Text("Entrance Exams",style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily))
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class Scholarship_Page extends StatefulWidget {
  const Scholarship_Page({super.key});

  @override
  State<Scholarship_Page> createState() => _Scholarship_PageState();
}

class _Scholarship_PageState extends State<Scholarship_Page> {
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Scholarship",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:22),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("1)APJ Abdul Kalam Scholarship(APJAK)  ",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("1)APJ Abdul Kalam Scholarship(APJAK)  ",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("3)Prof.Joseph Mundassery Scholarship Award(PJMS)",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("4)C H Muhammedkoya Scholarship(CHMS)",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("5)APJ Abdul Kalam Scholarship(APJAK)",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("6)Mother Teresa Scholarship(MTS)",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("7)Prof.Joseph Mundassery Scholarship Award(PJMS)",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/Ellipse 58.png"),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("8)C H Muhammedkoya Scholarship(CHMS)",style: GoogleFonts.poppins(color:Colors.black,fontSize :14,fontWeight :FontWeight.w500),),
            ),
          )
        ],
      ),

    );
  }
}

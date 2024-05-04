import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class EntranceExam extends StatefulWidget {
  const EntranceExam({super.key});

  @override
  State<EntranceExam> createState() => _EntranceExamState();
}

class _EntranceExamState extends State<EntranceExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Entrance Exams",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),),
      ),
    );
  }
}

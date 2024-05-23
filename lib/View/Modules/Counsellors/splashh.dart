import 'package:careernavigator/View/Modules/Counsellors/loginsign.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class CounsSplashScreen extends StatefulWidget {
  const CounsSplashScreen({super.key});

  @override
  State<CounsSplashScreen> createState() => _CounsSplashScreenState();
}

class _CounsSplashScreenState extends State<CounsSplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 7),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CounsellorLogin()));});
    return Scaffold(
      body:  Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [ HexColor("#D10DA6"),HexColor("#8038ca"),],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/Group 481610.png"),
            SizedBox(height: 10,),
            Text("CareerNavigator",style:GoogleFonts.getFont('Puppies Play',color: Colors.white,fontSize: 25),),

          ],
        ),
      ),
    );
  }
}

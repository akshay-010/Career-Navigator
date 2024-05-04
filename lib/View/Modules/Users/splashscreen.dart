import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'loginpage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 7),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login_Page()));});
    return Scaffold(
      body: Container(
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

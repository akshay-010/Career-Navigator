import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Modules/Admin/loginn.dart';
import '../Modules/Counsellors/loginsign.dart';
import '../Modules/Institutions/logininstitut.dart';
import '../Modules/Users/loginpage.dart';
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("https://images.pexels.com/photos/1557251/pexels-photo-1557251.jpeg?cs=srgb&dl=pexels-yungsaac-1557251.jpg&fm=jpg"))),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
            },
            child:   SizedBox(
              height: 100,width: 200,
              child: Card(
                elevation: 5,
                child: Center(
                  child:  Text("USER",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20,fontFamily: GoogleFonts.abhayaLibre().fontFamily),),
                ),
              ),
            ),
          ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
              },
              child:   SizedBox(
                height: 100,width: 200,
                child: Card(
                  elevation: 5,
                  child: Center(
                    child:  Text("ADMIN",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20,fontFamily: GoogleFonts.abhayaLibre().fontFamily),),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginInstitution()));
              },
              child:   SizedBox(
                height: 100,width: 200,
                child: Card(
                  elevation: 5,
                  child: Center(
                    child:  Text("INSTITUTION",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20,fontFamily: GoogleFonts.abhayaLibre().fontFamily),),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CounsellorLogin()));
              },
              child:   SizedBox(
                height: 100,width: 200,
                child: Card(
                  elevation: 5,
                  child: Center(
                    child: Text("COUNSELLOR",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20,fontFamily: GoogleFonts.abhayaLibre().fontFamily),),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

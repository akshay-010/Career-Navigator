import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var email = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor("#D10DA6"),
              HexColor("#8038ca"),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width/3,
                height: height/1.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hey, ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: height * 0.07,
                      ),
                    ),
                    Text(
                      "Welcome Back!, ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: height * 0.07,
                      ),
                    ),
                    Text(
                      "We are very happy to see you back!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: height * 0.020,
                        letterSpacing: 1.8,
                      ),
                    ),
                    SizedBox(
                        height: height*0.033
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: TextStyle(color: HexColor("#323A46"), fontSize: 20)),
                            SizedBox(
                              width: width * 0.5,
                              height: height*0.065,

                              child: TextFormField(
                                controller: email,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: height*0.020
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password", style: TextStyle(color: HexColor("#323A46"), fontSize: 20)),
                            SizedBox(
                              width: width * 0.5,
                              height: height*0.065,
                              child: TextFormField(
                                controller: password,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                         height: height*0.040
                        ),
                        SizedBox(
                          width: width,
                          height: height*0.065,
                          child: ElevatedButton(onPressed: (){},
                              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(HexColor("#3568FF")),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                              child: Text("Login",style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily,color: Colors.white,fontSize: 18),)),
                        )
                      ],
                    ),
                    SizedBox(height: height*0.022,),
                    Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider()
                          ),SizedBox(width: 10,),

                          Text("OR",style: TextStyle(fontFamily: GoogleFonts.inter().fontFamily,color: Colors.white,fontWeight: FontWeight.w600),),

                          SizedBox(width: 10,),
                          Expanded(
                              child: Divider()
                          ),
                        ]
                    ),
                  ],
                ),
              ),SizedBox(width: 30,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height/1.40,
                  width: width/2,
                  child: Image.asset("assets/Group 25 (1).png",scale: 0.2,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

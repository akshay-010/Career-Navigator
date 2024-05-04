import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class Forgot_Pass extends StatefulWidget {
  const Forgot_Pass({super.key});

  @override
  State<Forgot_Pass> createState() => _Forgot_PassState();
}

class _Forgot_PassState extends State<Forgot_Pass> {
  var pass =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height/2,
                width: width,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [ HexColor("#D10DA6"),HexColor("#8038ca"),],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Text("Forgot Password?",style: GoogleFonts.poppins(color:HexColor("#FFFCFC"),fontSize:30),),
                    SizedBox(height: 30),
                    Text("Reset your Account ",style: GoogleFonts.kreon(color:Colors.white,fontSize:17),),
                    SizedBox(height: 2,),
                    Text("Password ",style: GoogleFonts.kreon(color:Colors.white,fontSize:17),)

                  ],
                ),
              ),
              Container(
                height: height/2,width: width,
                child: Column(children: [
                  Spacer(),
                  Image.asset("assets/Ellipse 32.png")
                ],)
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: height/2,
              width: width*0.6,
              child: Stack(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      height: height*0.45,width: width*0.6,
                      decoration: BoxDecoration(color:  HexColor("#FFFCFC"),borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(height: 25,),
                            Text("Reset Password",style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w600,
                              fontSize: 17.0,),),
                            SizedBox(height: 30,),
                            TextFormField(
                              controller:pass ,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: Colors.green)
                                ),
                                prefixIcon: Icon(Icons.lock_outline),
                                hintText: "Password",
                              ),
                            ),
                            SizedBox(height: 15,),
                            TextFormField(
                              controller:pass ,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: Colors.green)
                                ),
                                prefixIcon: Icon(Icons.lock_outline),
                                hintText: "Confirm Password",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,width: 70,
                      decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            spreadRadius: 0.4,
                            offset: Offset(0, 8)
                        )
                      ],),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [HexColor("#F95715"),HexColor("#FF864E")])),
                            child: Center(child: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward,size: 30,color: Colors.white,)),),
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

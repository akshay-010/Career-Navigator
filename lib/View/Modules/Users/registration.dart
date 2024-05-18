import 'package:careernavigator/View/Modules/Users/bottombar.dart';
import 'package:careernavigator/View/Modules/Users/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class Registration_Page extends StatefulWidget {
  const Registration_Page({super.key});

  @override
  State<Registration_Page> createState() => _Registration_PageState();
}

class _Registration_PageState extends State<Registration_Page> {
  var name =TextEditingController();
  var qualification =TextEditingController();
  var gender =TextEditingController();
  var email =TextEditingController();
  var number =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              height: height/1.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                gradient: LinearGradient(colors: [ HexColor("#D10DA6"),HexColor("#8038ca"),],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              ),),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 50,),
                    Text("Registration",style: GoogleFonts.poppins(color:HexColor("#FFFCFC"),fontSize:30),),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        fillColor:HexColor("#FFFCFC"),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: HexColor("#666666"),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color:Colors.green,
                          ),
                        ),
                        hintText: "Name"
                      ),
                    ),
                    TextFormField(
                      controller: qualification,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          fillColor:HexColor("#FFFCFC"),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: HexColor("#666666"),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color:Colors.green,
                            ),
                          ),
                          hintText: "Qualification"
                      ),
                    ),
                    TextFormField(
                      controller: gender,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          fillColor:HexColor("#FFFCFC"),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: HexColor("#666666"),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color:Colors.green,
                            ),
                          ),
                          hintText: "Gender"
                      ),
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          fillColor:HexColor("#FFFCFC"),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: HexColor("#666666"),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color:Colors.green,
                            ),
                          ),
                          hintText: "Email"
                      ),
                    ),
                    TextFormField(
                      controller: number,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          fillColor:HexColor("#FFFCFC"),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: HexColor("#666666"),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color:Colors.green,
                            ),
                          ),
                          hintText: "Number"
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height/6,
              width: width,
              color: Colors.white,
              child: Center(
                child:  Padding(
                  padding: const EdgeInsets.only(left: 80,right: 80,top: 40,bottom: 40),
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(HexColor("#DB4D41")),),
                    onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));

                    }, child: Center(
                    child: Text("Submit",style: TextStyle(color: HexColor("#FFFCFC"),fontFamily: GoogleFonts.roboto().fontFamily,fontSize: height/43),),
                  ),),
                ),
                // child: Container(
                //   height: height/14,
                //   width: width/3.2,
                //   decoration: BoxDecoration(color: HexColor("#DB4D41"),borderRadius: BorderRadius.circular(30)),
                //   child: Center(
                //     child: Text("Submit",style: GoogleFonts.poppins(color:Colors.white,fontSize:height/40),),
                //   ),
                // ),
              ),
            ),
            Spacer(),
            Container(
                width: width,
                height: height/7.5,
                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/Ellipse 32.png"))),
               )

          ],
        ),
      ),
    );
  }
}

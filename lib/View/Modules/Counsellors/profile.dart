import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final hyt = MediaQuery.of(context).size.height;
    final wdt = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Notificationss",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),),
      ),
      body: SizedBox(
        height: hyt,
        width: wdt,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
              ),
              Positioned(
                  bottom: 0,
                  right: -12,
                  child: IconButton(
                    onPressed: (){},
                       icon: Icon(Icons.edit, color: Colors.black,))),
            ],
          ),
        ),
            SizedBox(
              height: hyt*0.02,
            ),
            Text("Rohit Sharma",style: TextStyle(fontSize: 17,fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w600,color: Colors.black),),

            SizedBox(
              height: hyt*0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55,right: 55),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor("#A527BC"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Bio...",
                        hintStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.5))),
                  ),
                  SizedBox(
                    height: hyt*0.026,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     IconButton(
                         style: ButtonStyle(
                           minimumSize: MaterialStatePropertyAll(Size(20, 2)),
                           shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                           backgroundColor: MaterialStatePropertyAll(HexColor("#A527BC"))
                         ),
                         onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                      
                      TextButton(onPressed: (){}, child: Text("Logout",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily),))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

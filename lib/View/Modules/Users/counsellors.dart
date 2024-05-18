import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'homelistcourses.dart';
class Counsellors extends StatefulWidget {
  const Counsellors({super.key});

  @override
  State<Counsellors> createState() => _CounsellorsState();
}

class _CounsellorsState extends State<Counsellors> {
  @override
  Widget build(BuildContext context) {
    final hyt =MediaQuery.of(context).size.height;
    final vdth =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Counsellors",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:22),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(itemCount: counsellorss.length,itemBuilder: (context,index){
          return SizedBox(
            height: hyt*0.13,width: vdth,
            child: ListTile(
              leading:  CircleAvatar(
                        radius: 45,
                        foregroundImage: NetworkImage( counsellorss[index]['image'],),
                      ),
            title:   Text( counsellorss[index]['names'],style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            subtitle: Text( counsellorss[index]['college'],style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,overflow: TextOverflow.ellipsis),),
            trailing:  Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text( counsellorss[index]['place'],style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,overflow: TextOverflow.ellipsis),
              ),
            ),
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class InstitutionAdmin extends StatefulWidget {
  const InstitutionAdmin({super.key});

  @override
  State<InstitutionAdmin> createState() => _InstitutionAdminState();
}

class _InstitutionAdminState extends State<InstitutionAdmin> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
       Column(
        children: [
          Text("Institutions",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily),),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,itemBuilder: (context,index){
              return  Padding(
                padding: EdgeInsets.all(14.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/Rectangle 102.png"),
                  ),
                  title: Text("Kerala University",style: TextStyle(overflow: TextOverflow.ellipsis,fontFamily: GoogleFonts.poppins().fontFamily,color: Colors.black),),
                  trailing: Text("Thiruvananthapuram",style: TextStyle(overflow: TextOverflow.ellipsis,fontFamily: GoogleFonts.poppins().fontFamily,color: Colors.black),),
                ),
              );
            }),
          )
        ],

    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CounsellorssAdmin extends StatelessWidget {
  const CounsellorssAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Text("Consellors",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily),),
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
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/Rectangle 102.png"),
                  ),
                  title: Text("Sunanda Rao",style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w600,fontSize: 15),),
                  subtitle: const Text("Maharaja’s College",style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 13,color: Colors.black),),
                  trailing: const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: SizedBox(
                        width: 100,
                        child: Text(" Ernakulam",style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black,fontSize: 13),)),
                  ),
                ),
              );
            }),
          )
        ],
      );

  }
}

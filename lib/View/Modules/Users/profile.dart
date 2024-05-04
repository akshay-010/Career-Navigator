import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Profile",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:22),),
      ),
      body: Column(
        children: [
          Container(
            height: height/4.5,width: width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi Shahzaib!",style: GoogleFonts.aBeeZee(color:Colors.black,fontWeight :FontWeight.w600,fontSize:16),),
                      Text("Pakistan",style: GoogleFonts.radioCanada(color :Colors.black,fontSize:14,fontWeight :FontWeight.w500),),
                    ],
                  )

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                InkWell(
                  onTap: (){},
                  child: ListTile(
                    leading: Image.asset("assets/Vector (6).png"),
                    title: Text("My Profile",style: GoogleFonts.roboto(color :Colors.black,fontSize:14,fontWeight :FontWeight.w400),),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,color: HexColor("#A527BC"),),
                  ),
                ),const SizedBox(height: 2,),
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      leading: Image.asset("assets/Vector (7).png"),
                      title: Text("Settings",style: GoogleFonts.roboto(color :Colors.black,fontSize:14,fontWeight :FontWeight.w400),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,color: HexColor("#A527BC"),),
                    ),
                  ),SizedBox(height: 2,),
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      leading: Image.asset("assets/Vector (8).png"),
                      title: Text("Help Center",style: GoogleFonts.roboto(color :Colors.black,fontSize:14,fontWeight :FontWeight.w400),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,color: HexColor("#A527BC"),),
                    ),
                  ),SizedBox(height: 2,),
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      leading: Image.asset("assets/Vector (9).png"),
                      title: Text("Intive Friends",style: GoogleFonts.roboto(color :Colors.black,fontSize:14,fontWeight :FontWeight.w400),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,color: HexColor("#A527BC"),),
                    ),
                  ),SizedBox(height: 2,),
                  InkWell(
                    onTap: (){},
                    child: ListTile(
                      leading: Image.asset("assets/Vector (10).png"),
                      title: Text("Logout",style: GoogleFonts.roboto(color :Colors.black,fontSize:14,fontWeight :FontWeight.w400),),
                      trailing: Icon(Icons.arrow_forward_ios_outlined,color: HexColor("#A527BC"),),
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

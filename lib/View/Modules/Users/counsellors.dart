import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Controller/adminbackendservices.dart';
import '../../../Model/adminmodel.dart';
import 'homelistcourses.dart';
class Counsellors extends StatefulWidget {
  const Counsellors({super.key});

  @override
  State<Counsellors> createState() => _CounsellorsState();
}

class _CounsellorsState extends State<Counsellors> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminBackend>(context);


    final hyt =MediaQuery.of(context).size.height;
    final vdth =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Counsellors",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:22),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder<List<AdminAddCounsellor>>(
          stream: provider.getCounsellorStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No institutions found'));
            }

            final counsellorList = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
                itemCount: counsellorList.length,
                itemBuilder: (context,index){
                  final counsellor = counsellorList[index];

                  return SizedBox(
                height: hyt*0.13,width: vdth,
                child: ListTile(
                  leading:  CircleAvatar(
                            radius: 45,
                      backgroundImage: counsellor.imageUrl.isNotEmpty
                          ? NetworkImage(counsellor.imageUrl)
                          : const AssetImage("assets/Ellipse 46.png")
                      as ImageProvider,
                      onBackgroundImageError: (exception, stackTrace) {
                        print('Image load error: $exception');
                      }
                          ),
                title:   Text( counsellor.counsellorname,style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                subtitle: Text( counsellor.location,style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,overflow: TextOverflow.ellipsis),),
                // trailing:  Padding(
                //   padding: const EdgeInsets.only(top: 30),
                //   child: Text( counsellor.,style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,overflow: TextOverflow.ellipsis),
                //   ),
                // ),
                ),
              );
            });
          }
        ),
      ),
    );
  }
}

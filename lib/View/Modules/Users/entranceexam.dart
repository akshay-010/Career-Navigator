import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Controller/adminbackendservices.dart';
import '../../../Model/adminmodel.dart';
class EntranceExam extends StatefulWidget {
  const EntranceExam({super.key});

  @override
  State<EntranceExam> createState() => _EntranceExamState();
}

class _EntranceExamState extends State<EntranceExam> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminBackend>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Entrance Exams",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),),
      ),
      body: SizedBox(
        width: double.infinity,height: double.infinity,
        child: FutureBuilder<List<AdmEntrance>>(
          future: provider.fetchEntranceExam(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No institutions found'));
            }
            final entrance= snapshot.data!;
            return ListView.builder(
                itemCount: entrance.length,
                itemBuilder: (context,index){
                  final entrancee = entrance[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: HexColor("cccccc").withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(entrancee.examname,style: TextStyle(color: Colors.black,fontFamily: GoogleFonts.inter().fontFamily,fontWeight: FontWeight.w600,fontSize: 18),overflow: TextOverflow.ellipsis,),
                        subtitle: Text(entrancee.examabout,style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: GoogleFonts.roboto().fontFamily),overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                  );
            });
          }
        ),
      )
    );
  }
}

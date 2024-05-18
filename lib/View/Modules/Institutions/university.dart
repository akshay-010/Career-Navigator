import 'package:careernavigator/View/Modules/Institutions/addcourse.dart';
import 'package:careernavigator/View/Modules/Institutions/addfaculty.dart';
import 'package:careernavigator/View/Modules/Institutions/addplacement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Controller/institutionbackend.dart';
import '../../../Model/institutionmodel.dart';

class UniversityPage extends StatelessWidget {
  const UniversityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final provider = Provider.of<InstitutionBackend>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Kerala University",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: StreamBuilder<List<InstitutionDetails>>(
        stream: provider.fetchInstitutionDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final institutionDetails = snapshot.data;

          if (institutionDetails == null || institutionDetails.isEmpty) {
            return Center(child: Text('No data available'));
          }

          final university = institutionDetails.first;
          return Column(
            children: [
              Container(
                height: height / 4.3,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,

                        image: university.imageUrl != null
                         ?NetworkImage(university.imageUrl) : AssetImage("assets/Rectangle 102.png") as ImageProvider
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                university.name,
                style: TextStyle(
                    letterSpacing: 0.7,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.033,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: height / 4,
                width: width / 1.2,
                child: Expanded(
                    child: Text(
                      university.about,
                  // "University of Kerala, formerly the University of Travancore,is a state-run public university in Thiruvananthapuram,the state capital of Kerala, India. It was established in1937 by a promulgation of the Maharajah of Travancore,Chithira Thirunal Balarama Varma who was also thefirst Chancellor of the university",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height * 0.036,
                    width: width * 0.23,
                    child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 2)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                            backgroundColor:
                                MaterialStatePropertyAll(HexColor("#D9D9D9"))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCourse()));
                        },
                        child: Center(
                          child: Text(
                            "Add Courses",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.036,
                    width: width * 0.23,
                    child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 2)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                            backgroundColor:
                                MaterialStatePropertyAll(HexColor("#D9D9D9"))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPlacements()));

                        },
                        child: Center(
                          child: Text(
                            "Add Placement",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.036,
                    width: width * 0.23,
                    child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 2)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                            backgroundColor:
                                MaterialStatePropertyAll(HexColor("#D9D9D9"))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFaculties()));
                        },
                        child: Center(
                          child: Text(
                            "Facuties",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                  ),
                ],
              )
            ],
          );
        }
      ),
    );
  }
}
//
//
// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
//
// import '../../../Controller/institutionbackend.dart';
// import '../../../Model/institutionmodel.dart';
//
// class UniversityPage extends StatelessWidget {
//   const UniversityPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return StreamBuilder<List<InstitutionDetails>>(
//       stream: Provider.of<InstitutionBackend>(context).fetchInstitutionDetails(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         final institutionDetails = snapshot.data;
//
//         if (institutionDetails == null || institutionDetails.isEmpty) {
//           return Center(child: Text('No data available'));
//         }
//
//         final university = institutionDetails.first;
//
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: HexColor("#A527BC"),
//             title: Text(
//               university.name,
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           body: Column(
//             children: [
//               Container(
//                 height: height / 4.3,
//                 width: width,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(university.imageUrl),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Text(
//                 university.name,
//                 style: TextStyle(
//                   letterSpacing: 0.7,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w700,
//                   fontSize: height * 0.033,
//                   fontFamily: GoogleFonts.poppins().fontFamily,
//                 ),
//               ),
//               SizedBox(height: 15),
//               SizedBox(
//                 height: height / 4,
//                 width: width / 1.2,
//                 child: Expanded(
//                   child: Text(
//                     university.about,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: GoogleFonts.poppins().fontFamily,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

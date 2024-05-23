// import 'package:careernavigator/Controller/institutionbackend.dart';
// import 'package:careernavigator/View/Modules/Institutions/university.dart';
// import 'package:careernavigator/View/Modules/Users/keralauniversity.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'dart:io';
//
// class AddInstitutions extends StatefulWidget {
//   const AddInstitutions({super.key});
//
//   @override
//   State<AddInstitutions> createState() => _AddInstitutionsState();
// }
//
// class _AddInstitutionsState extends State<AddInstitutions> {
//   var institutionname = TextEditingController();
//   var managername = TextEditingController();
//   var email = TextEditingController();
//   var location = TextEditingController();
//   var phone = TextEditingController();
//   var about = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<InstitutionBackend>(context);
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Add Institutions",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//       ),
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.only(left: 17, right: 17),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Institutions Name",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: GoogleFonts.poppins().fontFamily),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: institutionname,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: height * 0.015, horizontal: 5),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191"))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191")))),
//               ),
//               SizedBox(
//                 height: height * 0.019,
//               ),
//               Text(
//                 "Manager name",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: GoogleFonts.poppins().fontFamily),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: managername,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: height * 0.015, horizontal: 5),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191"))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191")))),
//               ),
//               SizedBox(
//                 height: height * 0.019,
//               ),
//               Text(
//                 "Email",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: GoogleFonts.poppins().fontFamily),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: email,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: height * 0.015, horizontal: 5),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191"))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191")))),
//               ),
//               SizedBox(
//                 height: height * 0.019,
//               ),
//               Text(
//                 "Location",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: GoogleFonts.poppins().fontFamily),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: location,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: height * 0.015, horizontal: 5),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191"))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191")))),
//               ),
//               SizedBox(
//                 height: height * 0.019,
//               ),
//               Text(
//                 "Phone",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: GoogleFonts.poppins().fontFamily),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: phone,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: height * 0.015, horizontal: 5),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191"))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191")))),
//               ),
//               SizedBox(
//                 height: height * 0.019,
//               ),
//               Text(
//                 "About",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     fontFamily: GoogleFonts.poppins().fontFamily),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               TextFormField(
//                 controller: about,
//                 maxLines: 3,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: height * 0.015, horizontal: 5),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191"))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: HexColor("#B49191")))),
//               ),
//               SizedBox(
//                 height: height * 0.019,
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     height: height * 0.036,
//                     width: width * 0.22,
//                     child: TextButton(
//                         style: ButtonStyle(
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5))),
//                             backgroundColor:
//                                 MaterialStatePropertyAll(HexColor("#D9D9D9"))),
//                         onPressed: () {
//                           provider.pickImage(ImageSource.gallery);
//                         },
//                         child: Center(
//                           child: Text(
//                             "Add Image",
//                             style: TextStyle(
//                                 fontSize: 10,
//                                 color: Colors.black,
//                                 fontFamily: GoogleFonts.poppins().fontFamily,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         )),
//                   ),
//                   SizedBox(
//                     width: width / 6,
//                   ),
//                   provider.image == null
//                       ? Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             height: 60,
//                             width: 60,
//                           ),
//                         )
//                       : Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             height: 60,
//                             width: 60,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: FileImage(provider.image!),
//                                 )),
//                           ),
//                         )
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.03,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 65, right: 65),
//                 child: ElevatedButton(
//                     style: ButtonStyle(
//                         padding: const MaterialStatePropertyAll(
//                             EdgeInsets.symmetric(horizontal: 2)),
//                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6))),
//                         minimumSize:
//                             const MaterialStatePropertyAll(Size(0, 50)),
//                         backgroundColor:
//                             MaterialStatePropertyAll(HexColor("#3568FF"))),
//                     onPressed: () {
//                       final provider = Provider.of<InstitutionBackend>(context,
//                           listen: false);
//                       provider
//                           .saveInstitutionDetails(
//                         name: institutionname.text,
//                         managerName: managername.text,
//                         email: email.text,
//                         location: location.text,
//                         phone: phone.text,
//                         about: about.text,
//                         // You can pass the image URL here if needed
//                       )
//                           .then((_) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => UniversityPage()));
//                       }).catchError((error) {
//                         // Handle error if needed
//                         // For example:
//                         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save institution details')));
//                       });
//                     },
//                     child: const Center(
//                       child: Text(
//                         "Next",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     )),
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

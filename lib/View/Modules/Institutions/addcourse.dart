// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class AddCourse extends StatelessWidget {
//   const AddCourse({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Kerala University",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Courses Name",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: GoogleFonts.poppins().fontFamily),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             TextFormField(
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                   isDense: true,
//                   contentPadding: EdgeInsets.symmetric(
//                       vertical: height * 0.02, horizontal: 5),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: HexColor("#B49191"))),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: HexColor("#B49191")))),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               "About",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: GoogleFonts.poppins().fontFamily),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             TextFormField(
//               maxLines: 7,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                   isDense: true,
//                   contentPadding: EdgeInsets.symmetric(
//                       vertical: height * 0.02, horizontal: 5),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: HexColor("#B49191"))),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: HexColor("#B49191")))),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 65, right: 65),
//               child: ElevatedButton(
//                   style: ButtonStyle(
//                       padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 2)),
//                       shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(6))),
//                       minimumSize: const MaterialStatePropertyAll(Size(0, 50)),
//                       backgroundColor:
//                       MaterialStatePropertyAll(HexColor("#3568FF"))),
//                   onPressed: () {},
//                   child: const Center(
//                     child: Text(
//                       "Update",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import 'allcourses.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> addCourse() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final String ownerId = user.uid;
        String? imageUrl;

        // Upload image if picked
        if (_image != null) {
          final File imageFile = File(_image!.path);
          final storageRef = FirebaseStorage.instance
              .ref()
              .child('courses/${ownerId}/${DateTime.now().toIso8601String()}');
          final uploadTask = storageRef.putFile(imageFile);
          final snapshot = await uploadTask.whenComplete(() {});
          imageUrl = await snapshot.ref.getDownloadURL();
        }

        await FirebaseFirestore.instance
            .collection('Admin')
            .doc('ADMIN')
            .collection("institutionadd")
            .doc(ownerId)
            .collection("courses")
            .add({
          'courseName': courseNameController.text,
          'about': aboutController.text,
          'imageUrl': imageUrl,
          'created_at': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Course added successfully')),
        );

        // Navigate to the CourseListPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllCourses(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user logged in')),
        );
      }
    } catch (e) {
      print('Error adding course: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add course: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Add Course",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Courses Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: courseNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: 5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: HexColor("#B49191"))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: HexColor("#B49191"))),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "About",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: aboutController,
                maxLines: 7,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: 5),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: HexColor("#B49191"))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: HexColor("#B49191"))),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Image'),
              ),
              if (_image != null) ...[
                 SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image:
                        FileImage(File(_image!.path)),
                          fit: BoxFit.cover

                        ), )
                  ),
                ),
              ],
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 65, right: 65),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 2)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                    minimumSize: const MaterialStatePropertyAll(Size(0, 50)),
                    backgroundColor:
                    MaterialStatePropertyAll(HexColor("#3568FF")),
                  ),
                  onPressed: addCourse,
                  child: const Center(
                    child: Text(
                      "Add Course",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

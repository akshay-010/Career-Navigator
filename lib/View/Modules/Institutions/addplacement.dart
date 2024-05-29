import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Controller/institutionbackend.dart';
import 'allcourses.dart';

class AddPlacement extends StatefulWidget {
  const AddPlacement({Key? key}) : super(key: key);

  @override
  State<AddPlacement> createState() => _AddPlacementState();
}

class _AddPlacementState extends State<AddPlacement> {
  final TextEditingController studentNameController = TextEditingController();

  final TextEditingController courseController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> addPlacements() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final String ownerId = user.uid;
        String? imageUrl;

        // Upload image if picked
        if (_image != null) {
          final File imageFile = File(_image!.path);
          final storageRef = FirebaseStorage.instance.ref().child(
              'placement/${ownerId}/${DateTime.now().toIso8601String()}');
          final uploadTask = storageRef.putFile(imageFile);
          final snapshot = await uploadTask.whenComplete(() {});
          imageUrl = await snapshot.ref.getDownloadURL();
        }

        await FirebaseFirestore.instance
            .collection('Admin')
            .doc('ADMIN')
            .collection("institutionadd")
            .doc(ownerId)
            .collection("placements")
            .add({
          'studentName': studentNameController.text,
          'course': courseController.text,
          'imageUrl': imageUrl,
          'created_at': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Placement added successfully')),
        );

        setState(() {
          studentNameController.clear();
          courseController.clear();
          _image = null;
        });

        // Navigate to the CourseListPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllCourses(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user logged in')),
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
        title: const Text(
          'Add Student Placement',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(25.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              const Text("Student Name"),
              const SizedBox(height: 5),
              TextFormField(
                controller: studentNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: 5),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: HexColor("#A527BC"),
                  )),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Courses name"),
              const SizedBox(height: 5),
              TextFormField(
                controller: courseController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: HexColor("#A527BC"),
                  )),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: 5),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: Text('Pick Image'),
              ),
              if (_image != null) ...[
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: FileImage(File(_image!.path)),
                            fit: BoxFit.cover),
                      )),
                ),
                const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {
                //    provide.clearImage();
                //   },
                //   child: Text('Clear Image'),
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
                    onPressed: () {
                      addPlacements();
                    },
                    child: const Center(
                      child: Text(
                        "Add Placement",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
            ])),
      ),
    );
  }
}

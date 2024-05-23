// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
//
// import '../../../Controller/Providers/counsellorbackendservice.dart';
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<CounsellorService>(context);
//
//
//     final User? user = FirebaseAuth.instance.currentUser;
//
//     if (user == null) {
//       return Scaffold(
//         body: Center(
//           child: Text('No user logged in'),
//         ),
//       );
//     }
//
//     final String ownerId = user.uid;
//     Future<Map<String, dynamic>?> fetchOwnedCounsellor() async {
//       try {
//         DocumentSnapshot<
//             Map<String, dynamic>> documentSnapshot = await FirebaseFirestore
//             .instance
//             .collection('Admin')
//             .doc('ADMIN')
//             .collection("counselloradd")
//             .doc(ownerId)
//             .get();
//
//         if (documentSnapshot.exists) {
//           return documentSnapshot.data();
//         } else {
//           print('No institution found for ownerId: $ownerId');
//           return null;
//         }
//       } catch (e) {
//         print('Error fetching owned institution: $e');
//         return null;
//       }
//     }
//
//
//
//
//     Future<void> updateCounsellorData(Map<String, dynamic> newData) async {
//       try {
//         final User? user = FirebaseAuth.instance.currentUser;
//
//         if (user == null) {
//           print('No user logged in');
//           return;
//         }
//
//         final String ownerId = user.uid;
//         await FirebaseFirestore.instance
//             .collection('Admin')
//             .doc('ADMIN')
//             .collection("counselloradd")
//             .doc(ownerId)
//             .update(newData);
//       } catch (e) {
//         print('Error updating counsellor data: $e');
//       }
//     }
//
//
//     final hyt = MediaQuery.of(context).size.height;
//     final wdt = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text("Notificationss",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),),
//       ),
//       body :
//            FutureBuilder<Map<String, dynamic>?>(
//              future: fetchOwnedCounsellor(),
//              builder: (context, snapshot) {
//                var counsellor = snapshot.data;
//                return SizedBox(
//                 height: hyt,
//                 width: wdt,
//                 child:  Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                    SizedBox(
//                   height: 115,
//                   width: 115,
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     fit: StackFit.expand,
//                     children: [
//                        CircleAvatar(
//                         backgroundImage: NetworkImage(counsellor?['imageUrl']),
//                       ),
//                       Positioned(
//                           bottom: 0,
//                           right: -15,
//                           child: IconButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStatePropertyAll(HexColor("#F95715").withOpacity(0.8))
//                             ),
//                             onPressed: (){
//                               updateCounsellorData(counsellor?['imageUrl']);
//                             },
//                                icon: Icon(Icons.edit, color: Colors.black,))),
//                     ],
//                   ),
//                 ),
//                     SizedBox(
//                       height: hyt*0.02,
//                     ),
//                     Text(counsellor?['counsellorname'] ?? 'n',style: TextStyle(fontSize: 17,fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w600,color: Colors.black),),
//
//                     SizedBox(
//                       height: hyt*0.04,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 55,right: 55),
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             maxLines: 5,
//                             keyboardType: TextInputType.text,
//                             decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: HexColor("#A527BC"),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                     borderSide: BorderSide(color: Colors.grey)),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15),
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 hintText: "Bio...",
//                                 hintStyle: TextStyle(
//                                     fontFamily: GoogleFonts.poppins().fontFamily,
//                                     fontSize: 13,
//                                     color: Colors.white.withOpacity(0.5))),
//                           ),
//                           SizedBox(
//                             height: hyt*0.026,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                              IconButton(
//                                  style: ButtonStyle(
//                                    minimumSize: MaterialStatePropertyAll(Size(20, 2)),
//                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
//                                    backgroundColor: MaterialStatePropertyAll(HexColor("#A527BC"))
//                                  ),
//                                  onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
//
//                               TextButton(onPressed: (){}, child: Text("Logout",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily),))
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//
//                      );
//              }
//            ),
//     );
//   }
// }







import 'dart:typed_data';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Providers/counsellorbackendservice.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  Uint8List? _webImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounsellorService>(context);

    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text('No user logged in'),
        ),
      );
    }

    final String ownerId = user.uid;

    Future<Map<String, dynamic>?> fetchOwnedCounsellor() async {
      try {
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('Admin')
            .doc('ADMIN')
            .collection("counselloradd")
            .doc(ownerId)
            .get();

        if (documentSnapshot.exists) {
          return documentSnapshot.data();
        } else {
          print('No counsellor found for ownerId: $ownerId');
          return null;
        }
      } catch (e) {
        print('Error fetching owned counsellor: $e');
        return null;
      }
    }

    Future<void> pickImage(ImageSource source) async {
      try {
        final pickedImage = await _picker.pickImage(source: source);
        if (pickedImage != null) {
          if (kIsWeb) {
            _webImage = await pickedImage.readAsBytes();
          } else {
            _image = File(pickedImage.path);
          }
        } else {
          _image = null;
          _webImage = null;
        }
        setState(() {});
      } catch (e) {
        print("Image picking failed: $e");
        _image = null;
        _webImage = null;
        setState(() {});
      }
    }

    Future<String> uploadImage(String ref) async {
      try {
        UploadTask uploadTask;

        if (kIsWeb && _webImage != null) {
          uploadTask = FirebaseStorage.instance
              .ref()
              .child(ref)
              .putData(_webImage!, SettableMetadata(contentType: 'image/jpeg'));
        } else if (_image != null) {
          uploadTask = FirebaseStorage.instance
              .ref()
              .child(ref)
              .putFile(_image!, SettableMetadata(contentType: 'image/jpeg'));
        } else {
          throw Exception("No image selected");
        }

        TaskSnapshot snapshot = await uploadTask;
        String downloadURL = await snapshot.ref.getDownloadURL();
        return downloadURL;
      } catch (e) {
        print("Image upload failed: $e");
        rethrow;
      }
    }

    Future<void> updateCounsellorData(Map<String, dynamic> newData, String ownerId) async {
      try {
        await FirebaseFirestore.instance
            .collection('Admin')
            .doc('ADMIN')
            .collection("counselloradd")
            .doc(ownerId)
            .update(newData);
      } catch (e) {
        print('Error updating counsellor data: $e');
      }
    }

    final hyt = MediaQuery.of(context).size.height;
    final wdt = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
          future: fetchOwnedCounsellor(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            var counsellor = snapshot.data;
            if (counsellor == null) {
              return Center(child: Text('Counsellor not found'));
            }
            return SizedBox(
              height: hyt,
              width: wdt,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(counsellor['imageUrl']),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -15,
                          child: IconButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  HexColor("#F95715").withOpacity(0.8)),
                            ),
                            onPressed: () async {
                              await pickImage(ImageSource.gallery);
                              if (_image != null || _webImage != null) {
                                String imageUrl = await uploadImage(
                                    'counsellor_images/${user.uid}');
                                counsellor['imageUrl'] = imageUrl;
                                await updateCounsellorData(
                                    counsellor, user.uid);
                                setState(() {});
                              }
                            },
                            icon: const Icon(Icons.edit, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: hyt * 0.02,
                  ),
                  Text(
                    counsellor['counsellorname'] ?? 'n',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: hyt * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55, right: 55),
                    child: Column(
                      children: [
                        TextFormField(
                          maxLines: 5,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: HexColor("#A527BC"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: Colors.black)),
                              hintText: "Bio...",
                              hintStyle: TextStyle(
                                  fontFamily:
                                  GoogleFonts.poppins().fontFamily,
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.5))),
                        ),
                        SizedBox(
                          height: hyt * 0.026,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                style: ButtonStyle(
                                    minimumSize:
                                    const MaterialStatePropertyAll(Size(20, 2)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5))),
                                    backgroundColor: MaterialStatePropertyAll(
                                        HexColor("#A527BC"))),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily:
                                      GoogleFonts.poppins().fontFamily),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

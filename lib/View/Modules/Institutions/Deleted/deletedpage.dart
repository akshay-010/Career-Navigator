//
// File? images;
//
// File? get image => images;
//
// Future<void> pickImage(ImageSource source) async {
//   final pickedImage = await ImagePicker().pickImage(source: source);
//   if (pickedImage != null) {
//     images = File(pickedImage.path);
//   } else {
//     images = null;
//   }
//   notifyListeners();
// }
//
// Future<String> uploadImage(File image) async {
//   try {
//     final user = _firebaseAuth.currentUser;
//     final storageRef = _firebaseStorage.ref().child('institution_images/${user!.uid}/${DateTime.now().toIso8601String()}');
//     final uploadTask = storageRef.putFile(image);
//     final snapshot = await uploadTask;
//     final downloadUrl = await snapshot.ref.getDownloadURL();
//     return downloadUrl;
//   } catch (e) {
//     print('Error uploading image: $e');
//     throw e;
//   }
// }
//
// Future<void> saveInstitutionDetails({
//   required String name,
//   required String managerName,
//   required String email,
//   required String location,
//   required String phone,
//   required String about,
// }) async {
//   try {
//     final user = _firebaseAuth.currentUser;
//
//     if (user != null) {
//       String imageUrl = '';
//       if (images != null) {
//         imageUrl = await uploadImage(images!);
//       }
//
//       final institutionDoc = _firebaseFirestore.collection('institutions').doc(user.uid);
//       await institutionDoc.collection('institutiondetails').add({
//         'name': name,
//         'managerName': managerName,
//         'email': email,
//         'location': location,
//         'phone': phone,
//         'about': about,
//         'imageUrl': imageUrl,
//       });
//     } else {
//       throw 'User not authenticated.';
//     }
//   } catch (e) {
//     print('Error saving institution details: $e');
//     throw e;
//   }
// }
//
//
//
//
// Stream<List<InstitutionDetails>> fetchInstitutionDetails() {
//   final user = _firebaseAuth.currentUser;
//   if (user != null) {
//     return _firebaseFirestore
//         .collection('institutions')
//         .doc(user.uid)
//         .collection('institutiondetails')
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//         .map((doc) => InstitutionDetails.fromMap(doc.data()))
//         .toList());
//   } else {
//     throw 'User not authenticated.';
//   }
// }



 // institution loginpage ui

// import 'package:careernavigator/Controller/Providers/userprovider.dart';
// import 'package:careernavigator/Controller/institutionbackend.dart';
// import 'package:careernavigator/View/Modules/Institutions/addfaculty.dart';
// import 'package:careernavigator/View/Modules/Institutions/addinstitution.dart';
// import 'package:careernavigator/View/Modules/Institutions/university.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:tab_container/tab_container.dart';
//
// import '../Users/forgotpassword.dart';
// import '../Users/registration.dart';
//
// class LoginInstitution extends StatefulWidget {
//   LoginInstitution({super.key});
//
//   @override
//   State<LoginInstitution> createState() => _LoginInstitutionState();
// }
//
// class _LoginInstitutionState extends State<LoginInstitution> {
//   final TextEditingController _emailController = TextEditingController();
//
//   final TextEditingController _passwordController = TextEditingController();
//
//
//
//   String _errorMessage = '';
//
//   // Function to handle login button press
//   void _login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     AuthService authService = AuthService(); // Create an instance of AuthService
//     String? result = await authService.login(email, password);
//
//     setState(() {
//       _errorMessage = result ?? 'Login failed';
//     });
//
//     if (_errorMessage == "Login successful") {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AddFaculties()), // Adjust destination as needed
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(_errorMessage)),
//       );
//     }}
//
//
//   var pass = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery
//         .of(context)
//         .size
//         .height;
//     final width = MediaQuery
//         .of(context)
//         .size
//         .width;
//
//     // var _tabController;
//
//     final provider = Provider.of<UserProvider>(context);
//     final instiprovider = Provider.of<InstitutionBackend>(context);
//
//     AuthService authService = AuthService();
//     return Scaffold(
//         body: Stack(children: [
//           Column(
//             children: [
//               Container(
//                 height: height / 2,
//                 width: width,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                     HexColor("#D10DA6"),
//                     HexColor("#8038ca"),
//                   ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Text(
//                       "Welcome",
//                       style: GoogleFonts.poppins(
//                           color: HexColor("#FFFCFC"),
//                           fontSize: 28,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Sign Up to Continue',
//                       style: GoogleFonts.kreon(
//                           color: Colors.white, fontSize: 15),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: height / 2,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Spacer(),
//                     Text(
//                       "Or Signin With",
//                       style: GoogleFonts.poppins(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           width: width / 3.4,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               color: HexColor("#3C5899"),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Image.asset(
//                                 "assets/Facebook F.png",
//                                 scale: 1.16,
//                               ),
//                               Text(
//                                 "Facebook",
//                                 style: GoogleFonts.poppins(
//                                     color: Colors.white, fontSize: 12.6),
//                               ),
//                               Container(
//                                 height: 20,
//                                 width: 20,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: width / 3.4,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               color: HexColor("#DB4D41"),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Image.asset(
//                                 "assets/Google Plus.png",
//                                 scale: 1.16,
//                               ),
//                               Text(
//                                 "Google",
//                                 style: GoogleFonts.poppins(
//                                     color: Colors.white, fontSize: 12.6),
//                               ),
//                               Container(
//                                 height: 20,
//                                 width: 20,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 60,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Align(
//               alignment: Alignment.center,
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20),
//                   child: Container(
//                       height: height * 0.43,
//                       width: width,
//                       child: Stack(
//                         children: [
//                           Column(
//                             children: [
//                               Card(
//                                 elevation: 10,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25)),
//                                 child: Container(
//                                   height: height * 0.38,
//                                   width: width,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(25),
//                                       color: Colors.white),
//                                   child: Container(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                           TextFormField(
//                                             controller: _emailController,
//                                             keyboardType: TextInputType.text,
//                                             decoration: InputDecoration(
//                                               contentPadding:
//                                               EdgeInsets.symmetric(
//                                                   vertical: 5),
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(15),
//                                                 borderSide:
//                                                 BorderSide(
//                                                     color: Colors.black),
//                                               ),
//                                               focusedBorder: OutlineInputBorder(
//                                                   borderRadius:
//                                                   BorderRadius.circular(15),
//                                                   borderSide: BorderSide(
//                                                       color: Colors.green)),
//                                               prefixIcon:
//                                               Icon(Icons.email_outlined),
//                                               hintText: "E-mail",
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                           TextFormField(
//                                             controller: _passwordController,
//                                             keyboardType: TextInputType.text,
//                                             decoration: InputDecoration(
//                                               contentPadding:
//                                               EdgeInsets.symmetric(
//                                                   vertical: 5),
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(15),
//                                                 borderSide:
//                                                 BorderSide(
//                                                     color: Colors.black),
//                                               ),
//                                               focusedBorder: OutlineInputBorder(
//                                                   borderRadius:
//                                                   BorderRadius.circular(15),
//                                                   borderSide: BorderSide(
//                                                       color: Colors.green)),
//                                               prefixIcon: Icon(
//                                                   Icons.lock_outline),
//                                               hintText: "Password",
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 2,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                                 children: [
//                                                   Transform.scale(
//                                                     scale: 0.6,
//                                                     child: Checkbox(
//                                                         splashRadius: 0.2,
//                                                         value: provider.pass,
//                                                         onChanged: (val) {
//                                                           provider.checkbox();
//                                                         }),
//                                                   ),
//                                                   Text(
//                                                     "Remember Password",
//                                                     style: GoogleFonts
//                                                         .poppins(
//                                                         color: Colors.black,
//                                                         fontSize: 10),
//                                                   )
//                                                 ],
//                                               ),
//                                               TextButton(
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (
//                                                                 context) =>
//                                                                 Forgot_Pass()));
//                                                   },
//                                                   child: Text(
//                                                     "Forgot Password?",
//                                                     style: GoogleFonts
//                                                         .poppins(
//                                                         color: Colors.black,
//                                                         fontSize: 10),
//                                                   ))
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               height: 70,
//                               width: 70,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: <BoxShadow>[
//                                   BoxShadow(
//                                       color: Colors.black54,
//                                       blurRadius: 10,
//                                       spreadRadius: 0.4,
//                                       offset: Offset(0, 8))
//                                 ],
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: Center(
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         gradient: LinearGradient(colors: [
//                                           HexColor("#F95715"),
//                                           HexColor("#FF864E")
//                                         ])),
//                                     child: Center(
//                                       child: IconButton(
//                                           onPressed: () {
//                                             _login();
//                                             if (_errorMessage.isNotEmpty)
//                                               Text(
//                                                 _errorMessage,
//                                                 style: TextStyle(color: Colors.red),
//                                               );
//                                             // authService.login(_emailController.text, _passwordController.text);
//                                             // if (_errorMessage.isNotEmpty)
//                                             //   Text(
//                                             //     _errorMessage,
//                                             //     style: TextStyle(color: Colors.red),
//                                             //   );
//                                             // authService.login(_emailController.text, _passwordController.text);
//
//                                             // Navigator.push(context, MaterialPageRoute(builder: (context) => Registration_Page()));
//
//                                           },
//                                           icon: const Icon(
//                                             Icons.arrow_forward,
//                                             size: 30,
//                                             color: Colors.white,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                   )
//               )
//           )
//         ]));
//   }
// }
//



   // login instituion backend


//
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../Model/institutionmodel.dart';
// import '../View/Modules/Institutions/addinstitution.dart';
//
// class InstitutionBackend extends ChangeNotifier {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
//
// }
//
//
// class AuthService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Function to log in an institution owner
//   Future<String?> login(String email, String password) async {
//     try {
//       // Query the Admin collection
//       QuerySnapshot adminSnapshot = await _firestore.collection('Admin').get();
//
//       bool found = false;
//
//       for (QueryDocumentSnapshot adminDoc in adminSnapshot.docs) {
//         // Query the nested institutionadd collection
//         QuerySnapshot institutionAddSnapshot = await adminDoc.reference.collection('institutionadd').get();
//
//         for (QueryDocumentSnapshot institutionDoc in institutionAddSnapshot.docs) {
//           // Check the institution details directly in the institution document
//           if (institutionDoc.exists) {
//             var data = institutionDoc.data() as Map<String, dynamic>;
//             if (data['institutionEmail'] == email && data['password'] == password) {
//               found = true;
//               break;
//             }
//           }
//         }
//
//         if (found) break;
//       }
//
//       if (found) {
//         return "Login successful";
//       } else {
//         return "Invalid email or password";
//       }
//     } catch (e) {
//       print("Login failed: $e");
//       return "Login failed";
//     }
//   }
// }



       // institution owner login email,pass


// class AuthService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Function to log in an institution owner
//   Future<String?> login(String email, String password) async {
//     try {
//       // Query the Admin collection
//       QuerySnapshot adminSnapshot = await _firestore.collection('Admin').get();
//
//       for (QueryDocumentSnapshot adminDoc in adminSnapshot.docs) {
//         // Query the nested institutionadd collection with filters
//         QuerySnapshot institutionAddSnapshot = await adminDoc.reference
//             .collection('institutionadd')
//             .where('institutionname', isEqualTo: email)
//             .where('password', isEqualTo: password)
//             .get();
//
//         if (institutionAddSnapshot.docs.isNotEmpty) {
//           return "Login successful";
//         }
//       }
//
//       return "Invalid email or password";
//     } catch (e) {
//       print("Login failed: $e");
//       return "Login failed";
//     }
//   }
// }

        // that owner function call ui

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:careernavigator/Controller/Providers/userprovider.dart';
// import 'package:careernavigator/Controller/institutionbackend.dart';
// import 'package:careernavigator/View/Modules/Institutions/addfaculty.dart';
// import 'package:careernavigator/View/Modules/Users/forgotpassword.dart';
// import 'package:careernavigator/Controller/AuthService.dart';
//
// class LoginInstitution extends StatefulWidget {
//   LoginInstitution({super.key});
//
//   @override
//   State<LoginInstitution> createState() => _LoginInstitutionState();
// }
//
// class _LoginInstitutionState extends State<LoginInstitution> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String _errorMessage = '';
//
//   // Function to handle login button press
//   void _login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     AuthService authService = AuthService(); // Create an instance of AuthService
//     String? result = await authService.login(email, password);
//
//     setState(() {
//       _errorMessage = result ?? 'Login failed';
//     });
//
//     if (_errorMessage == "Login successful") {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AddFaculties()), // Adjust destination as needed
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(_errorMessage)),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     final provider = Provider.of<UserProvider>(context);
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: height / 2,
//                 width: width,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [HexColor("#D10DA6"), HexColor("#8038ca")],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 50),
//                     Text(
//                       "Welcome",
//                       style: GoogleFonts.poppins(
//                         color: HexColor("#FFFCFC"),
//                         fontSize: 28,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Sign Up to Continue',
//                       style: GoogleFonts.kreon(color: Colors.white, fontSize: 15),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.white,
//                 height: height / 2,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Spacer(),
//                     Text(
//                       "Or Signin With",
//                       style: GoogleFonts.poppins(
//                         color: Colors.black,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         SocialLoginButton(
//                           color: HexColor("#3C5899"),
//                           imagePath: "assets/Facebook F.png",
//                           text: "Facebook",
//                         ),
//                         SocialLoginButton(
//                           color: HexColor("#DB4D41"),
//                           imagePath: "assets/Google Plus.png",
//                           text: "Google",
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 60),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 height: height * 0.43,
//                 width: width,
//                 child: Stack(
//                   children: [
//                     Column(
//                       children: [
//                         Card(
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: Container(
//                             height: height * 0.38,
//                             width: width,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: Column(
//                                 children: [
//                                   SizedBox(height: 15),
//                                   CustomTextField(
//                                     controller: _emailController,
//                                     hintText: "E-mail",
//                                     prefixIcon: Icons.email_outlined,
//                                   ),
//                                   SizedBox(height: 15),
//                                   CustomTextField(
//                                     controller: _passwordController,
//                                     hintText: "Password",
//                                     prefixIcon: Icons.lock_outline,
//                                   ),
//                                   SizedBox(height: 2),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Transform.scale(
//                                             scale: 0.6,
//                                             child: Checkbox(
//                                               splashRadius: 0.2,
//                                               value: provider.pass,
//                                               onChanged: (val) {
//                                                 provider.checkbox();
//                                               },
//                                             ),
//                                           ),
//                                           Text(
//                                             "Remember Password",
//                                             style: GoogleFonts.poppins(
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) => Forgot_Pass(),
//                                             ),
//                                           );
//                                         },
//                                         child: Text(
//                                           "Forgot Password?",
//                                           style: GoogleFonts.poppins(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: LoginButton(onPressed: _login),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SocialLoginButton extends StatelessWidget {
//   final Color color;
//   final String imagePath;
//   final String text;
//
//   SocialLoginButton({
//     required this.color,
//     required this.imagePath,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     return Container(
//       width: width / 3.4,
//       height: 40,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset(imagePath, scale: 1.16),
//           Text(
//             text,
//             style: GoogleFonts.poppins(color: Colors.white, fontSize: 12.6),
//           ),
//           Container(height: 20, width: 20),
//         ],
//       ),
//     );
//   }
// }
//
// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final IconData prefixIcon;
//
//   CustomTextField({
//     required this.controller,
//     required this.hintText,
//     required this.prefixIcon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 5),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide(color: Colors.black),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide(color: Colors.green),
//         ),
//         prefixIcon: Icon(prefixIcon),
//         hintText: hintText,
//       ),
//     );
//   }
// }
//
// class LoginButton extends StatelessWidget {
//   final VoidCallback onPressed;
//
//   LoginButton({required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       width: 70,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             blurRadius: 10,
//             spreadRadius: 0.4,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: LinearGradient(
//                 colors: [HexColor("#F95715"), HexColor("#FF864E")],
//               ),
//             ),
//             child: Center(
//               child: IconButton(
//                 onPressed: onPressed,
//                 icon: const Icon(
//                   Icons.arrow_forward,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



    // institution owner login step 2  function


// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AuthService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Function to log in an institution owner
//   Future<String?> login(String email, String password) async {
//     try {
//       // Query the Admin collection
//       QuerySnapshot adminSnapshot = await _firestore.collection('Admin').get();
//
//       bool found = false;
//
//       for (QueryDocumentSnapshot adminDoc in adminSnapshot.docs) {
//         print('Checking Admin ID: ${adminDoc.id}');
//
//         // Query the nested institutionadd collection
//         QuerySnapshot institutionAddSnapshot = await adminDoc.reference.collection('institutionadd').get();
//
//         for (QueryDocumentSnapshot institutionDoc in institutionAddSnapshot.docs) {
//           print('Checking Institution: ${institutionDoc.id} under Admin: ${adminDoc.id}');
//
//           // Check the institution details directly in the institution document
//           if (institutionDoc.exists) {
//             var data = institutionDoc.data() as Map<String, dynamic>;
//             print('Institution Email: ${data['institutionEmail']}, Password: ${data['password']}');
//
//             if (data['institutionEmail'] == email && data['password'] == password) {
//               found = true;
//               break;
//             }
//           }
//         }
//
//         if (found) break;
//       }
//
//       if (found) {
//         return "Login successful";
//       } else {
//         return "Invalid email or password";
//       }
//     } catch (e) {
//       print("Login failed: $e");
//       return "Login failed";
//     }
//   }
// }


    // call

// import 'package:flutter/material.dart';
// import 'package:your_app_path/auth_service.dart'; // Ensure correct import path
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String _errorMessage = '';
//
//   // Function to handle login button press
//   void _login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     AuthService authService = AuthService(); // Create an instance of AuthService
//     String? result = await authService.login(email, password);
//
//     setState(() {
//       _errorMessage = result ?? 'Login failed';
//     });
//
//     if (_errorMessage == "Login successful") {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AddInstitutions()), // Adjust destination as needed
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(_errorMessage)),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             if (_errorMessage.isNotEmpty)
//               Text(
//                 _errorMessage,
//                 style: TextStyle(color: Colors.red),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }






// login intitution owner new function


// Future<void> loginInstitutionOwner(String email, String password) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//
//     String uid = userCredential.user!.uid;
//     DocumentSnapshot institutionSnapshot = await _firebaseFirestore
//         .collection('Admin')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection("institutionadd")
//         .doc(uid)
//         .get();
//
//     if (institutionSnapshot.exists) {
//       // Successfully logged in
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => InstitutionHomePage(uid: uid)),
//       );
//     } else {
//       // User does not exist
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('No institution found for this user')),
//       );
//     }
//   } catch (e) {
//     print('Login failed: $e');
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login failed: $e')));
//   }
// }
// }



          // Admin added institution with credential
//
// onPressed: () async {
// // Validate if the email and password fields are not empty
// if (provider.emailController.text.isEmpty ||
// provider.passwordController.text.isEmpty) {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text('Please fill in all fields')),
// );
// return;
// }
//
// // Attempt to create a new user with the provided email and password
// try {
// UserCredential userCredential = await FirebaseAuth.instance
//     .createUserWithEmailAndPassword(
// email: provider.emailController.text,
// password: provider.passwordController.text,
// );
//
// // Clear text fields after successful user creation
// provider.emailController.clear();
// provider.passwordController.clear();
//
// // Show success message
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text('User created successfully')),
// );
// } catch (e) {
// // Handle any errors that occur during user creation
// print('Error creating user: $e');
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text('Error creating user: $e')),
// );
//
// // Store the email and password securely for later use
// final storage = FlutterSecureStorage();
// await storage.write(
// key: 'institution_owner_email',
// value: provider.emailController.text);
// await storage.write(
// key: 'institution_owner_password',
// value: provider.passwordController.text);
//
// // Clear text fields after successful addition
// provider.emailController.clear();
// provider.passwordController.clear();
//
// // Show success message
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text('Institution successfully added')),
// );
// }
// },



        // call admin credential log int

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   // Sign in with email and password
//                   UserCredential userCredential =
//                   await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: emailController.text,
//                     password: passwordController.text,
//                   );
//
//                   // If login is successful, navigate to another screen
//                   // For example:
//                   Navigator.pushNamed(context, '/dashboard');
//                 } catch (e) {
//                   print('Login error: $e');
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Login failed: $e')),
//                   );
//                 }
//               },
//               child: Text('Sign In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




    // institution login new fetch image
//     // LOGIN 1

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'university_page.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   final UserCredential userCredential =
//                   await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: emailController.text,
//                     password: passwordController.text,
//                   );
//
//                   final String ownerId = userCredential.user!.uid;
//
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UniversityPage(ownerId: ownerId),
//                     ),
//                   );
//                 } catch (e) {
//                   print('Login error: $e');
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Login failed: $e')),
//                   );
//                 }
//               },
//               child: Text('Sign In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



  // UNIVERSITY PAGE2

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'addcourse.dart';
// import 'addfaculty.dart';
// import 'addplacement.dart';
//
// class UniversityPage extends StatelessWidget {
//   final String ownerId;
//
//   const UniversityPage({Key? key, required this.ownerId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Kerala University",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//       ),
//       body: FutureBuilder<Map<String, dynamic>?>(
//         future: fetchOwnedInstitution(), // Fetch institution details logic
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             var institution = snapshot.data;
//             if (institution != null) {
//               return Column(
//                 children: [
//                   Container(
//                     height: height / 4.3,
//                     width: width,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                                 institution['imageUrl'] ?? 'No name'))),
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     institution['institutionname'] ?? 'No name',
//                     style: TextStyle(
//                         letterSpacing: 0.7,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontSize: height * 0.033,
//                         fontFamily: GoogleFonts.poppins().fontFamily),
//                   ),
//                   SizedBox(height: 15),
//                   SizedBox(
//                     height: height / 4,
//                     width: width / 1.2,
//                     child: Expanded(
//                         child: Text(
//                           "about",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: GoogleFonts.poppins().fontFamily,
//                               fontSize: 14),
//                         )),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SizedBox(
//                         height: height * 0.036,
//                         width: width * 0.23,
//                         child: TextButton(
//                           style: ButtonStyle(
//                             padding: MaterialStatePropertyAll(
//                                 EdgeInsets.symmetric(horizontal: 2)),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5))),
//                             backgroundColor:
//                             MaterialStatePropertyAll(HexColor("#D9D9D9")),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => AddCourse(),
//                                 ));
//                           },
//                           child: Center(
//                             child: Text(
//                               "Add Courses",
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.black,
//                                   fontFamily: GoogleFonts.poppins().fontFamily,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.036,
//                         width: width * 0.23,
//                         child: TextButton(
//                           style: ButtonStyle(
//                             padding: MaterialStatePropertyAll(
//                                 EdgeInsets.symmetric(horizontal: 2)),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5))),
//                             backgroundColor:
//                             MaterialStatePropertyAll(HexColor("#D9D9D9")),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => AddPlacement(
//                                       ownerId: ownerId), // Passing ownerId
//                                 ));
//                           },
//                           child: Center(
//                             child: Text(
//                               "Add Placement",
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.black,
//                                   fontFamily: GoogleFonts.poppins().fontFamily,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height * 0.036,
//                         width: width * 0.23,
//                         child: TextButton(
//                           style: ButtonStyle(
//                             padding: MaterialStatePropertyAll(
//                                 EdgeInsets.symmetric(horizontal: 2)),
//                             shape: MaterialStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(5))),
//                             backgroundColor:
//                             MaterialStatePropertyAll(HexColor("#D9D9D9")),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => AddFaculties(),
//                                 ));
//                           },
//                           child: Center(
//                             child: Text(
//                               "Facuties",
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.black,
//                                   fontFamily: GoogleFonts.poppins().fontFamily,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               );
//             } else {
//               return Center(child: Text('No owned institutions found.'));
//             }
//           } else {
//             return Center(child: Text('No owned institutions found.'));
//           }
//         },
//       ),
//     );
//   }
//
//   Future<Map<String, dynamic>?> fetchOwnedInstitution() async {
//     // Fetch institution details logic
//   }
// }


   // ADD PLACEMENT 3

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'institution_form_provider.dart';
// import 'institution_details_page.dart';
//
// class AddPlacement extends StatelessWidget {
//   final String ownerId;
//
//   const AddPlacement({Key? key, required this.ownerId}) : super(key: key);
//
//   Future<void> savePlacementDetails(BuildContext context) async {
//     final provider = Provider.of<InstitutionFormProvider>(context, listen: false);
//     if (provider.pickedImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please pick an image')));
//       return;
//     }
//
//     try {
//       DocumentReference docRef = await FirebaseFirestore.instance
//           .collection('Admin')
//           .doc('ADMIN')
//           .collection("institutionadd")
//           .doc(ownerId)
//           .collection('placements')
//           .add({
//         'studentName': provider.studentNameController.text,
//         'place': provider.placeController.text,
//         'imageUrl': provider.pickedImage!.path, // This should be a URL if you upload the image to a storage
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Placement added successfully')));
//
//       // Navigate to InstitutionDetailsPage
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => InstitutionDetailsPage(institutionId: docRef.id),
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add placement: $e')));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Placement'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Consumer<InstitutionFormProvider>(
//           builder: (context, provider, _) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 Text("Student Name"),
//                 SizedBox(height: 5),
//                 TextFormField(
//                   controller: provider.studentNameController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: 5),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text("Place"),
//                 SizedBox(height: 5),
//                 TextFormField(
//                   controller: provider.placeController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: 5),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     provider.pickImage();
//                   },
//                   child: Text('Pick Image'),
//                 ),
//                 if (provider.pickedImage != null) ...[
//                   SizedBox(height: 20),
//                   Image.file(
//                     provider.pickedImage!,
//                     height: 200,
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       provider.clearImage();
//                     },
//                     child: Text('Clear Image'),
//                   ),
//                 ],
//                 SizedBox(height: 40),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 65, right: 65),
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       await savePlacementDetails(context);
//                     },
//                     child: Text("Add Placement"),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }




   // INSTITUTION ALL DETAILS 4

//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class InstitutionDetailsPage extends StatelessWidget {
//   final String institutionId;
//
//   const InstitutionDetailsPage({Key? key, required this.institutionId}) : super(key: key);
//
//   Future<Map<String, dynamic>?> fetchInstitutionDetails() async {
//     DocumentSnapshot doc = await FirebaseFirestore.instance
//         .collection('Admin')
//         .doc('ADMIN')
//         .collection("institutionadd")
//         .doc(institutionId)
//         .get();
//
//     return doc.data() as Map<String, dynamic>?;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Institution Details",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//       ),
//       body: FutureBuilder<Map<String, dynamic>?>(
//         future: fetchInstitutionDetails(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             var institution = snapshot.data;
//             if (institution != null) {
//               return Column(
//                 children: [
//                   Container(
//                     height: height / 4.3,
//                     width: width,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                           institution['imageUrl'] ?? 'No Image',
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     institution['institutionname'] ?? 'No name',
//                     style: TextStyle(
//                       letterSpacing: 0.7,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w700,
//                       fontSize: height * 0.033,
//                       fontFamily: GoogleFonts.poppins().fontFamily,
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   SizedBox(
//                     height: height / 4,
//                     width: width / 1.2,
//                     child: Expanded(
//                       child: Text(
//                         institution['about'] ?? 'No details available',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: GoogleFonts.poppins().fontFamily,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             } else {
//               return Center(child: Text('No institution details found.'));
//             }
//           } else {
//             return Center(child: Text('No institution details found.'));
//           }
//         },
//       ),
//     );
//   }
// }




 // FINAL TOUCH MAIN 5


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class InstitutionDetailsPage extends StatelessWidget {
//   final String institutionId;
//
//   const InstitutionDetailsPage({Key? key, required this.institutionId}) : super(key: key);
//
//   Future<Map<String, dynamic>?> fetchInstitutionDetails() async {
//     DocumentSnapshot doc = await FirebaseFirestore.instance
//         .collection('Admin')
//         .doc('ADMIN')
//         .collection("institutionadd")
//         .doc(institutionId)
//         .get();
//
//     return doc.data() as Map<String, dynamic>?;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Institution Details",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
//         ),
//       ),
//       body: FutureBuilder<Map<String, dynamic>?>(
//         future: fetchInstitutionDetails(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             var institution = snapshot.data;
//             if (institution != null) {
//               return Column(
//                 children: [
//                   Container(
//                     height: height / 4.3,
//                     width: width,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                           institution['imageUrl'] ?? 'No Image',
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     institution['institutionname'] ?? 'No name',
//                     style: TextStyle(
//                       letterSpacing: 0.7,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w700,
//                       fontSize: height * 0.033,
//                       fontFamily: GoogleFonts.poppins().fontFamily,
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   SizedBox(
//                     height: height / 4,
//                     width: width / 1.2,
//                     child: Expanded(
//                       child: Text(
//                         institution['about'] ?? 'No details available',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: GoogleFonts.poppins().fontFamily,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             } else {
//               return Center(child: Text('No institution details found.'));
//             }
//           } else {
//             return Center(child: Text('No institution details found.'));
//           }
//         },
//       ),
//     );
//   }
// }

// // import 'package:careernavigator/View/Modules/Institutions/university.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// //
// // import 'instututionfetchsecond.dart';
// //
// // class LoginPage extends StatelessWidget {
// //   const LoginPage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final TextEditingController emailController = TextEditingController();
// //     final TextEditingController passwordController = TextEditingController();
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(labelText: 'Email'),
// //             ),
// //             TextField(
// //               controller: passwordController,
// //               decoration: InputDecoration(labelText: 'Password'),
// //               obscureText: true,
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 try {
// //                   // Sign in with email and password
// //                   UserCredential userCredential =
// //                   await FirebaseAuth.instance.signInWithEmailAndPassword(
// //                     email: emailController.text,
// //                     password: passwordController.text,
// //                   );
// //                   final String ownerId = userCredential.user!.uid;
// //
// //                   // If login is successful, navigate to another screen
// //                   // For example:
// //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>InstitutionOwnerPage(ownerId: ownerId)));
// //                 } catch (e) {
// //                   print('Login error: $e');
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('Login failed: $e')),
// //                   );
// //                 }
// //               },
// //               child: Text('Sign In'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// import 'package:careernavigator/View/Modules/Institutions/university.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'instututionfetchsecond.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController emailController = TextEditingController();
//     final TextEditingController passwordController = TextEditingController();
//
//
//
//     // signin(context) async {
//     //   await FirebaseAuth.instance
//     //       .signInWithEmailAndPassword(
//     //       email: emailController.text, password: passwordController.text)
//     //       .then(
//     //         (credential) {
//     //       String id = credential.user!.uid;
//     //       print("lllllllllllllllllllllllllllllllllllllllllllllllllll");
//     //       print(id);
//     //       print("jjjjjjjjjjjjjjjjjjjjjjjjj");
//     //       Navigator.of(context).push(MaterialPageRoute(
//     //         builder: (context) {
//     //           return InstitutionOwnerPage(ownerId: '',);
//     //         },
//     //       ));
//     //     },
//     //   );
//     // }
//
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
//               // onPressed: (){
//               //   signin(context);
//               // },
//               onPressed: () async {
//                 try {
//                   final UserCredential userCredential =
//                   await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: emailController.text,
//                     password: passwordController.text,
//                   );
//
//                   // Get the user ID of the logged-in owner
//                   final String ownerId = userCredential.user!.uid;
//
//                   // If login is successful, navigate to the InstitutionOwnerPage and pass the ownerId
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => InstitutionOwnerPage(ownerId: ownerId),
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
//
//           ],
//         ),
//       ),
//     );
//   }
//
// }
//
//
//
//

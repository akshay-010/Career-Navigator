// // // owner_service.dart
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// //
// // class OwnerService {
// //   final String ownerId;
// //
// //   OwnerService({required this.ownerId});
// //
// //   Future<List<Map<String, dynamic>>> fetchOwnedInstitutions() async {
// //     try {
// //       QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
// //           .collection('Admin')
// //           .doc('ADMIN')
// //           .collection("institutionadd")
// //           .get();
// //
// //       List<Map<String, dynamic>> institutions = [];
// //       querySnapshot.docs.forEach((doc) {
// //         institutions.add(doc.data());
// //       });
// //
// //       return institutions;
// //     } catch (e) {
// //       print('Error fetching owned institutions: $e');
// //       return [];
// //     }
// //   }
// // }
// // // institution_owner_page.dart
// //
// //  // Import the OwnerService
// //
// // class InstitutionOwnerPage extends StatelessWidget {
// //   final String ownerId; // Assuming you have owner ID to fetch owned institutions
// //
// //   const InstitutionOwnerPage({Key? key, required this.ownerId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final OwnerService ownerService = OwnerService(ownerId: ownerId);
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Owned Institutions'),
// //       ),
// //       body: FutureBuilder<List<Map<String, dynamic>>>(
// //         future: ownerService.fetchOwnedInstitutions(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
// //             // Assuming you have UI to display owned institutions
// //             return ListView.builder(
// //               itemCount: snapshot.data!.length,
// //               itemBuilder: (context, index) {
// //                 var institution = snapshot.data![index];
// //                 return ListTile(
// //                   title: Text(institution['institutionname']),
// //                   subtitle: Text(institution['location']),
// //                   // Display more details as needed
// //                 );
// //               },
// //             );
// //           } else {
// //             return Center(child: Text('No owned institutions found.'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class InstitutionOwnerPage extends StatelessWidget {
// //   final String ownerId;
// //
// //   const InstitutionOwnerPage({Key? key, required this.ownerId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Owned Institutions'),
// //       ),
// //       body: FutureBuilder<List<String>>(
// //         future: fetchOwnedInstitutionIds(ownerId),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
// //             // Display the fetched institution IDs
// //             return ListView.builder(
// //               itemCount: snapshot.data!.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text('Institution ID: ${snapshot.data![index]}'),
// //                 );
// //               },
// //             );
// //           } else {
// //             return Center(child: Text('No owned institutions found.'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// //
// //   Future<List<String>> fetchOwnedInstitutionIds(String ownerId) async {
// //     try {
// //       final QuerySnapshot<Map<String, dynamic>> snapshot =
// //       await FirebaseFirestore.instance
// //           .collection('Admin')
// //           .doc(ownerId)
// //           .collection("institutionadd")
// //           .get();
// //
// //       if (snapshot.docs.isEmpty) {
// //         print('No owned institutions found for ownerId: $ownerId');
// //         return [];
// //       }
// //
// //       // Extract institution IDs from documents
// //       final List<String> institutionIds =
// //       snapshot.docs.map((doc) => doc.id).toList();
// //       print('Owned institution IDs for ownerId $ownerId: $institutionIds');
// //       return institutionIds;
// //     } catch (e) {
// //       print('Error fetching owned institution IDs: $e');
// //       return [];
// //     }
// //   }
// // }
//
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// //
// // class InstitutionOwnerPage extends StatelessWidget {
// //   final String ownerId;
// //
// //   const InstitutionOwnerPage({Key? key, required this.ownerId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Owned Institutions'),
// //       ),
// //       body: FutureBuilder<List<String>>(
// //         future: fetchOwnedInstitutionIds(ownerId),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
// //             // Display the fetched institution IDs
// //             return ListView.builder(
// //               itemCount: snapshot.data!.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text('Institution ID: ${snapshot.data![index]}'),
// //
// //                 );
// //               },
// //             );
// //           } else {
// //             return Center(child: Text('No owned institutions found.'));
// //           }
// //         },
// //       ),
// //     );
// //   }
// //
// //   Future<List<String>> fetchOwnedInstitutionIds(String ownerId) async {
// //     try {
// //       final QuerySnapshot<Map<String, dynamic>> snapshot =
// //       await FirebaseFirestore.instance
// //           .collection('Admin')
// //           .doc(ownerId)
// //           .collection("institutionadd")
// //           .get();
// //
// //       if (snapshot.docs.isEmpty) {
// //         print('No owned institutions found for ownerId: $ownerId');
// //         return [];
// //       }
// //
// //       // Extract institution IDs from documents
// //       final List<String> institutionIds =
// //       snapshot.docs.map((doc) => doc.id).toList();
// //       print('Owned institution IDs for ownerId $ownerId: $institutionIds');
// //       return institutionIds;
// //     } catch (e) {
// //       print('Error fetching owned institution IDs: $e');
// //       return [];
// //     }
// //   }
// // }
//
//
//
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// //
// // import '../../../Model/adminmodel.dart';
// //
// // class OwnerService {
// //
// //
// //   OwnerService();
// //
// //
// //
// // }
// // // institution_owner_page.dart
// //
// //  // Import the OwnerService
// //
// // class InstitutionOwnerPage extends StatelessWidget {
// //   final String ownerId; // Assuming you have owner ID to fetch owned institutions
// //
// //   AdminAddInstitution? adminAddInstitution;
// //   fetchCurrentUserData() async {
// //     final snapshot = await FirebaseFirestore.instance
// //         .collection("Admin")
// //         .doc(FirebaseAuth.instance.currentUser!.uid)
// //         .get();
// //     if (snapshot.exists) {
// //       adminAddInstitution =AdminAddInstitution.fromMap(snapshot.data()!);
// //
// //     }
// //   }
// //    InstitutionOwnerPage({Key? key, required this.ownerId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Owned Institutions'),
// //       ),
// //       body: Column(
// //         children: [
// //           FutureBuilder(
// //             future: fetchCurrentUserData(),
// //             builder: (context, snapshot) {
// //               return SizedBox(
// //                 height: 500,
// //                 child: ListView.builder(itemBuilder: (context,index){
// //                   return ListTile(
// //                     leading: Text(adminAddInstitution!.location),
// //                   );
// //                 }),
// //               );
// //             }
// //           )
// //         ],
// //       )
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
//
//
//
// // institution_owner_page.dart
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../../../Controller/institutionbackend.dart';
//
// class InstitutionOwnerPage extends StatelessWidget {
//   final String ownerId;
//
//   const InstitutionOwnerPage({Key? key, required this.ownerId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final OwnerService ownerService = OwnerService(ownerId: ownerId);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Owned Institutions'),
//       ),
//       body: FutureBuilder<Map<String, dynamic>?>(
//         future: ownerService.fetchOwnedInstitution(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             var institution = snapshot.data;
//             if (institution != null) {
//               return ListTile(
//                 title: Text(institution['institutionname'] ?? 'No name'),
//                 subtitle: Text(institution['location'] ?? 'No location'),
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
// }

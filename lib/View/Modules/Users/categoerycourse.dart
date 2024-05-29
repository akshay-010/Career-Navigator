import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoeryCourse extends StatefulWidget {
   CategoeryCourse({super.key,required this.categoery});
 var categoery;
  @override
  State<CategoeryCourse> createState() => _CategoeryCourseState();
}

class _CategoeryCourseState extends State<CategoeryCourse> {
  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> fetchAllCourses() async {
      try {
        final institutionsSnapshot = await FirebaseFirestore.instance
            .collection('Admin')
            .doc('ADMIN')
            .collection('institutionadd')
            .get();

        List<Map<String, dynamic>> courses = [];

        for (var institutionDoc in institutionsSnapshot.docs) {
          final coursesSnapshot = await institutionDoc.reference
              .collection('courses')
              .where('category', isEqualTo: widget.categoery)
              .get();

          for (var courseDoc in coursesSnapshot.docs) {
            courses.add(courseDoc.data());
          }
        }

        return courses;
      } catch (e) {
        print("Error fetching courses: $e");
        return [];
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Courses",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchAllCourses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final courses = snapshot.data ?? [];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return Padding(
                            padding: EdgeInsets.all(15.0),
                            child: ListTile(
                                leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        NetworkImage(course['imageUrl'])),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    course['courseName'],
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )));
                      }),
                ),
              );
            }),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class CategoeryCourse extends StatefulWidget {
//   const CategoeryCourse({Key? key});
//
//   @override
//   State<CategoeryCourse> createState() => _CategoeryCourseState();
// }
//
// class _CategoeryCourseState extends State<CategoeryCourse> {
//   late String selectedCategory = 'Plus two'; // Default category
//
//   Future<List<Map<String, dynamic>>> fetchCoursesByCategory(String category) async {
//     try {
//       final institutionsSnapshot = await FirebaseFirestore.instance
//           .collection('Admin')
//           .doc('ADMIN')
//           .collection('institutionadd')
//           .get();
//
//       List<Map<String, dynamic>> courses = [];
//
//       for (var institutionDoc in institutionsSnapshot.docs) {
//         final coursesSnapshot = await institutionDoc.reference
//             .collection('courses')
//             .where('category', isEqualTo: category)
//             .get();
//
//         for (var courseDoc in coursesSnapshot.docs) {
//           courses.add(courseDoc.data());
//         }
//       }
//
//       return courses;
//     } catch (e) {
//       print("Error fetching courses: $e");
//       return [];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Courses",
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 22,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_list),
//             onPressed: () {
//               _showFilterDialog();
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchCoursesByCategory(selectedCategory),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           final courses = snapshot.data ?? [];
//           return ListView.builder(
//             itemCount: courses.length,
//             itemBuilder: (context, index) {
//               final course = courses[index];
//               return Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     radius: 25,
//                     backgroundImage: NetworkImage(course['imageUrl']),
//                   ),
//                   title: Padding(
//                     padding: const EdgeInsets.only(left: 5),
//                     child: Text(
//                       course['courseName'],
//                       style: GoogleFonts.poppins(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   void _showFilterDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Select Category'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _buildCategoryButton('SSLC'),
//             _buildCategoryButton('Plus two'),
//             _buildCategoryButton('VHSE'),
//             _buildCategoryButton('UG'),
//             _buildCategoryButton('Diploma'),
//             _buildCategoryButton('PG'),
//           ],
//         ),
//       ),
//     );
//   }
//


//   Widget _buildCategoryButton(String category) {
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           selectedCategory = category;
//         });
//         Navigator.of(context).pop();
//       },
//       child: Text(
//         category,
//         style: TextStyle(color: selectedCategory == category ? Colors.blue : Colors.black),
//       ),
//     );
//   }
// }

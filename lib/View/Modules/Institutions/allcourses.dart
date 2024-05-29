import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


class AllCourses extends StatefulWidget {
  const AllCourses({super.key}) ;

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text('No user logged in'),
        ),
      );
    }

    final String ownerId = user.uid;



    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#A527BC"),
          title: Text(
            "Institutions",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: height * 0.22,
                width: width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/Rectangle 102.png"))),
              ),
              SizedBox(
                height: height * 0.077,
                child: TabBar(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  indicator: const BubbleTabIndicator(
                      indicatorColor: Colors.grey
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 20,
                  labelColor: const Color.fromRGBO(111, 31, 40, 1),
                  indicatorColor: Colors.blue,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.blue,
                  tabs: [
                    Tab(
                      child: Text(
                        "Courses",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#1E1E1E")),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Placement",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#1E1E1E")),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Faculties",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#1E1E1E")),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  StreamBuilder<QuerySnapshot>(
                    stream:  FirebaseFirestore.instance
                    .collection('Admin')
                    .doc('ADMIN')
                    .collection("institutionadd")
                    .doc(ownerId)
                    .collection("courses")
                    .orderBy('created_at', descending: true)
                    .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No courses found.'));
                      }

                      final courses = snapshot.data!.docs;

                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:courses.length,
                          itemBuilder: (context, index) {
                            final course = courses[index].data() as Map<String, dynamic>;
                        
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(course['imageUrl'],),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Text(
                                  course['courseName'],
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream:  FirebaseFirestore.instance
                          .collection('Admin')
                          .doc('ADMIN')
                          .collection("institutionadd")
                          .doc(ownerId)
                          .collection("placements")
                          .orderBy('created_at', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No courses found.'));
                        }

                        final placements = snapshot.data!.docs;
                      return Padding(
                        padding: const EdgeInsets.only(left: 9,right: 9),
                        child: GridView.builder(
                          itemCount: placements.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.54,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            final placement = placements[index].data() as Map<String, dynamic>;
                            return SizedBox(
                              height: height / 3.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height / 8,
                                    decoration: BoxDecoration(
                                      image:  DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            placement['imageUrl']),
                                      ),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 3,
                                          strokeAlign: BorderSide.strokeAlignInside),
                                    ),
                                  ),
                                  Text(
                                    placement['studentName'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                   Text(
                                    placement['course'],
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream:  FirebaseFirestore.instance
                          .collection('Admin')
                          .doc('ADMIN')
                          .collection("institutionadd")
                          .doc(ownerId)
                          .collection("faculty")
                          .orderBy('created_at', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No courses found.'));
                        }

                        final faculty = snapshot.data!.docs;
                      return Padding(
                        padding: const EdgeInsets.only(left: 9,right: 9),
                        child: GridView.builder(
                          itemCount: faculty.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.54,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            final faculties = faculty[index].data() as Map<String, dynamic>;
                            return Container(
                              height: height / 3.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: height / 8,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3,
                                        strokeAlign: BorderSide.strokeAlignInside,
                                      ),
                                      image:  DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          faculties['imageUrl']),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    faculties['teacherName'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                   Text(
                                    faculties['course'],
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

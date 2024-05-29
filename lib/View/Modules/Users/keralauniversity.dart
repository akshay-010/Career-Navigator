import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Model/adminmodel.dart';
import 'homelistcourses.dart';

class KeralaUniversity extends StatefulWidget {
   KeralaUniversity({super.key,required this.institution}) ;
  final AdminAddInstitution institution;

  @override
  State<KeralaUniversity> createState() => _KeralaUniversityState();
}

class _KeralaUniversityState extends State<KeralaUniversity> {



  Future<List<Map<String, dynamic>>> _fetchFaculty() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Admin')
        .doc('ADMIN')
        .collection('institutionadd')
        .doc(widget.institution.userId)
        .collection('faculty')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }



  Future<List<Map<String, dynamic>>> _fetchFPlacement() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Admin')
        .doc('ADMIN')
        .collection('institutionadd')
        .doc(widget.institution.userId)
        .collection('placements')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }



  Future<List<Map<String, dynamic>>> _fetchCourse() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Admin')
        .doc('ADMIN')
        .collection('institutionadd')
        .doc(widget.institution.userId)
        .collection('courses')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }




  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#A527BC"),
          title: Text(
            widget.institution.institutionname,
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
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.institution.imageUrl))),
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
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _fetchCourse(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      final courses = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(course['imageUrl'])),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 5),
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
                      );
                    }
                  ),
                  FutureBuilder<List<Map<String, dynamic>>>(
                      future: _fetchFPlacement(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      final placement = snapshot.data ?? [];
                      return Padding(
                        padding: const EdgeInsets.only(left: 9,right: 9),
                        child: GridView.builder(
                          itemCount: placement.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.54,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            final placements = placement[index];
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
                                        image: NetworkImage(placements['imageUrl']),
                                      ),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 3,
                                          strokeAlign: BorderSide.strokeAlignInside),
                                    ),
                                  ),
                                  Text(
                                    placements['studentName'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                   Text(
                                    placements['course'],
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
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _fetchFaculty(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      final faculties = snapshot.data ?? [];
                      return Padding(
                        padding: const EdgeInsets.only(left: 9,right: 9),
                        child: GridView.builder(
                          itemCount: faculties.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.54,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 5,
                          ),
                          itemBuilder: (context, index) {
                            final faculty = faculties[index];
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
                                           faculty['imageUrl']),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    faculty['teacherName'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                   Text(
                                    faculty['course'],
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

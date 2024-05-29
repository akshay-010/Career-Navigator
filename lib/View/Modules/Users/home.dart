import 'package:careernavigator/View/Modules/Users/homelistcourses.dart';
import 'package:careernavigator/View/Modules/Users/notifications.dart';
import 'package:careernavigator/View/Modules/Users/popularcourses.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Controller/backendservices.dart';
import '../../../Model/usermodel.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List<UserRegistration>? registrations;

  @override
  void initState() {
    super.initState();
    fetchRegistrations();
  }

  Future<void> fetchRegistrations() async {
    try {
      final provider = Provider.of<BackendServices>(context, listen: false);
      registrations = await provider.fetchRegistrations();
      setState(() {}); // Refresh UI after data fetch
    } catch (e) {
      print("Error fetching registrations: $e");
    }
  }

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
          final coursesSnapshot =
              await institutionDoc.reference.collection('courses').get();

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

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final provider = Provider.of<BackendServices>(context);

    String? userId = FirebaseAuth.instance.currentUser?.uid;

    UserRegistration? currentUserRegistration = registrations?.firstWhere(
      (registration) => registration.userid == userId,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Row(
          children: [
            Text(
              "Hi,",
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(width: 4),
            Text(
              currentUserRegistration?.Name ?? '',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170,
                width: width,
                child: CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageviewIndex) {
                    return Container(
                      height: height / 2,
                      width: width,
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 9),
                                Text(
                                  "Learn All About the ",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "UI/UX",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      "Course",
                                      style: GoogleFonts.poppins(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Join and become professional.",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 14),
                                SizedBox(
                                  height: height * 0.045,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          HexColor("#FF864E")),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Center(
                                      child: Text(
                                        "Start Learn Now",
                                        style: TextStyle(
                                            color: HexColor("#FFFCFC"),
                                            fontFamily: GoogleFonts.roboto()
                                                .fontFamily),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              child: Image.asset("assets/Group 25.png"),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.3,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Top Categories",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: topcatgry.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: HexColor("#A527BC"),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                topcatgry[index]['course'],
                                Image.asset(
                                  "assets/bar-chart-grouped-fill.png",
                                  scale: 0.9,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Popular_Course()));
                      },
                      child: Text(
                        "Popular Courses",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: height / 2.4,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: fetchAllCourses(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        final courses = snapshot.data ?? [];
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: courses.length,
                          itemBuilder: (context, index) {
                            final course = courses[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  height: height / 2.4,
                                  width: width / 1.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height * 0.14,
                                        width: width,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          image: course['imageUrl'] != null &&
                                                  course['imageUrl'].isNotEmpty
                                              ? DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      course['imageUrl']),
                                                )
                                              : null,
                                        ),
                                        child: course['imageUrl'] == null ||
                                                course['imageUrl'].isEmpty
                                            ? Center(child: Text('No Image'))
                                            : null,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width,
                                              child: Expanded(
                                                child: Text(
                                                  course['courseName'] ?? '',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                      fontSize: 18.5,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizedBox(
                                              height: height * 0.054,
                                              child: Expanded(
                                                child: Text(
                                                  course['about'],
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.black.withOpacity(0.7),
                                                      fontSize: 14.5,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "4.5",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(width: 6),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                  size: 15,
                                                ),
                                                const SizedBox(width: 20),
                                                Text(
                                                  "446k",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  "Learners",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 22),
                                            Container(
                                              height: height * 0.033,
                                              width: width / 3.5,
                                              color: HexColor("#FFE6DB"),
                                              child: Center(
                                                child: Text(
                                                  "Video Lessons",
                                                  style: GoogleFonts.poppins(
                                                      color:
                                                          HexColor("#666666"),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Image(
                                                  fit: BoxFit.cover,
                                                  width: 20,
                                                  height: 20,
                                                  image: AssetImage(
                                                      "assets/Group 27.png"),
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  "Enroll and win reward",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

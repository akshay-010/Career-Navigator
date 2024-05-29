import 'package:careernavigator/View/Modules/Users/homelistcourses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'categoerycourse.dart';
class Courses_Page extends StatefulWidget {
  const Courses_Page({super.key});

  @override
  State<Courses_Page> createState() => _Courses_PageState();
}

class _Courses_PageState extends State<Courses_Page> {
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
          await institutionDoc.reference.collection('courses').where('category',isEqualTo: 'Plus two').get();

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


    final height =MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text("Courses",style: GoogleFonts.poppins(color:Colors.white,fontWeight:FontWeight.w500,fontSize:20),),
      ),
      body: Container(
        height: double.infinity,width: double.infinity,
        child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Table(
              columnWidths: Map(),
              children: [
                TableRow(
                  children: [
                    InkWell(
                      overlayColor: MaterialStatePropertyAll(Colors.transparent),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoeryCourse(categoery: "SSLC",)));

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)
                          ),
                          child: Container(
                            height: height*0.1,width: width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: HexColor("#A527BC")
                            ),
                            child: Center(
                              child: ListTile(
                                leading:  Text("SSLC",style: GoogleFonts.roboto(color:Colors.white,fontSize:17,fontWeight:FontWeight.w700),),
                                trailing: Image.asset("assets/bar-chart-grouped-fill.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      overlayColor: MaterialStatePropertyAll(Colors.transparent),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoeryCourse(categoery: "Plus two",)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: height*0.1,width: width/2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: HexColor("#A527BC")
                          ),
                          child: Center(
                            child: ListTile(
                              leading:  Text("Plus two",style: GoogleFonts.roboto(color:Colors.white,fontSize:17,fontWeight:FontWeight.w700),),
                              trailing: Image.asset("assets/bar-chart-grouped-fill.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),

                TableRow(
                    children: [
                      InkWell(
                        overlayColor: MaterialStatePropertyAll(Colors.transparent),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoeryCourse(categoery: "VHSE",)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: height*0.1,width: width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: HexColor("#A527BC")
                            ),
                            child: Center(
                              child: ListTile(
                                leading:  Text("VHSE",style: GoogleFonts.roboto(color:Colors.white,fontSize:17,fontWeight:FontWeight.w700),),
                                trailing: Image.asset("assets/bar-chart-grouped-fill.png"),
                              ),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        overlayColor: MaterialStatePropertyAll(Colors.transparent),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoeryCourse(categoery: "Graduation",)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: height*0.1,width: width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: HexColor("#A527BC")
                            ),
                            child: Center(
                              child: ListTile(
                                leading:  Text("UG",style: GoogleFonts.roboto(color:Colors.white,fontSize:17,fontWeight:FontWeight.w700),),
                                trailing: Image.asset("assets/bar-chart-grouped-fill.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),

                TableRow(
                    children: [
                      InkWell(
                        overlayColor: MaterialStatePropertyAll(Colors.transparent),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoeryCourse(categoery: "Diploma",)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: height*0.1,width: width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: HexColor("#A527BC")
                            ),
                            child: Center(
                              child: ListTile(
                                leading:  Text("Diploma",style: GoogleFonts.roboto(color:Colors.white,fontSize:17,fontWeight:FontWeight.w700),),
                                trailing: Image.asset("assets/bar-chart-grouped-fill.png"),
                              ),
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        overlayColor: MaterialStatePropertyAll(Colors.transparent),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoeryCourse(categoery: "Postgraduation",)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: height*0.1,width: width/2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: HexColor("#A527BC")
                            ),
                            child: Center(
                              child: ListTile(
                                leading:  Text("PG",style: GoogleFonts.roboto(color:Colors.white,fontSize:17,fontWeight:FontWeight.w700),),
                                trailing: Image.asset("assets/bar-chart-grouped-fill.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ],
            ),
          ),
      )
    );
  }
}

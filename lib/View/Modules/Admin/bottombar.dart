import 'package:careernavigator/View/Modules/Admin/addcounsellors.dart';
import 'package:careernavigator/View/Modules/Admin/institutionadmin.dart';
import 'package:careernavigator/View/Modules/Admin/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Providers/userprovider.dart';
import 'addinstitutions.dart';
import 'counsellors.dart';
class BottomBarrr extends StatefulWidget {
  const BottomBarrr({super.key});

  @override
  State<BottomBarrr> createState() => _BottomBarrrState();
}

class _BottomBarrrState extends State<BottomBarrr> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,height: height,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              HexColor("#D10DA6"),
              HexColor("#8038ca"),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 45),
          child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                ),
                IconButton(onPressed: (){
                  provider.tab();
                },

                    icon: Icon(Icons.notifications,color: provider.selectedIndex ==0 ?Colors.black :Colors.white,)),
                IconButton(onPressed: (){
                  provider.tab1();
                },
                    icon: Icon(Icons.home,color: provider.selectedIndex ==1 ?Colors.black :Colors.white,)),
                IconButton(onPressed: (){
                  provider.tab2();
                }, icon: Icon(Icons.person,color: provider.selectedIndex ==2 ?Colors.black :Colors.white,)),
                IconButton(onPressed: (){
                  provider.tab3();
                }, icon: Icon(Icons.add_home_work_rounded,color: provider.selectedIndex ==3 ?Colors.black :Colors.white,)),
                IconButton(onPressed: (){
                  provider.tab4();
                }, icon: Icon(Icons.add_circle_sharp,color: provider.selectedIndex ==4 ?Colors.black :Colors.white,))

              ],
            ),
           SizedBox(
             width: 30,
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               SizedBox(
                 height: height*0.03,
               ),
               RichText(text: TextSpan(
                 children: [
                   TextSpan(
                     text: 'Learn All About the ',
                     style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: height*0.06,fontFamily: GoogleFonts.poppins().fontFamily)
                   ),
                   TextSpan(
                       text: '\n'
                   ),
                   TextSpan(
                     text: 'UI/UX',
                     style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: height*0.06,fontFamily: GoogleFonts.poppins().fontFamily)
                   ),
                   TextSpan(
                       text: 'Course',
                       style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: height*0.06,fontFamily: GoogleFonts.poppins().fontFamily)
                   ),
                   TextSpan(
                       text: '\n'
                   ),
                   TextSpan(
                       text: '\n'
                   ),
                   TextSpan(
                     text: 'Join and become professional.',
                     style: TextStyle(color: Colors.white,fontSize: height*0.02)
                   ),
                 ]
               )),
               Image.asset("assets/Group 25 (1).png",scale: height*0.0018,)
             ],
           ),
            SizedBox(
              width: 20,
            ),Spacer(),
            Visibility(
                visible: provider.selectedIndex == 0,
                child: Container(
                  color: Colors.transparent,
                  height: height,
                  width: width/2.8,
                  child: NotificationAdmin(),
                )

            ),
            Visibility(
                visible: provider.selectedIndex == 1,
                child: Container(
                  color: Colors.transparent,
                  height: height,
                  width: width/2.8,
                  child: InstitutionAdmin(),
                )

            ),
            Visibility(
                visible: provider.selectedIndex == 2,
                child: Container(
                  color: Colors.transparent,
                  height: height,
                  width: width/2.8,
                  child: CounsellorssAdmin(),
                )

            ),
            Visibility(
                visible: provider.selectedIndex == 3,
                child: Container(
                  color: Colors.transparent,
                  height: height,
                  width: width/2.8,
                  child: AddAdminInstitutions(),
                )

            ),
            Visibility(
                visible: provider.selectedIndex == 4,
                child: Container(
                  color: Colors.transparent,
                  height: height,
                  width: width/2.8,
                  child: AddCounsellorsAdmin(),
                )

            ),
            SizedBox(
              width: 40,
            )
          ],
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     SizedBox(
      //       height:
      //       MediaQuery.of(context).size.width * .04,
      //     ),
      //     Column(
      //       children: [
      //         InkWell(
      //           onTap: () {
      //             provider.tab();
      //           },
      //           child: Container(
      //             alignment: Alignment.center,
      //             height: 38,
      //             width: 106,
      //             decoration: BoxDecoration(
      //               color: provider.selectedIndex == 0
      //                   ? HexColor("C0A0A0")
      //                   : Colors.white,
      //               border:
      //               Border.all(color: Colors.black),
      //               borderRadius:
      //               BorderRadius.circular(8),
      //             ),
      //             child: Text(
      //               "Recommended",
      //               style: TextStyle(
      //                 color: provider.selectedIndex == 0
      //                     ? Colors.white
      //                     : HexColor("C0A0A0"),
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(width: 5),
      //         InkWell(
      //           onTap: () {
      //             provider.tab1();
      //           },
      //           child: Container(
      //             alignment: Alignment.center,
      //             height: 38,
      //             width: 106,
      //             decoration: BoxDecoration(
      //               color: provider.selectedIndex == 1
      //                   ? HexColor("C0A0A0")
      //                   : Colors.white,
      //               border:
      //               Border.all(color: Colors.black),
      //               borderRadius:
      //               BorderRadius.circular(8),
      //             ),
      //             child: Text(
      //               "All Books",
      //               style: TextStyle(
      //                 color: provider.selectedIndex == 1
      //                     ? Colors.white
      //                     : HexColor("C0A0A0"),
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Visibility(
      //       visible: provider.selectedIndex == 0,
      //       child: SizedBox(
      //           height: 350,
      //           child: GridView.builder(
      //             padding: const EdgeInsets.all(5),
      //             gridDelegate:
      //             const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 3,
      //               childAspectRatio: 0.9,
      //             ),
      //             itemCount: 4,
      //             itemBuilder:
      //                 (BuildContext context, int index) {
      //               return Card(
      //                 elevation: 5,
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       image: AssetImage(
      //                           "assets/Ellipse 47.png"),
      //                       // fit: BoxFit.cover, // Make sure the image covers the container
      //                     ),
      //                     color: Colors.white,
      //                     borderRadius:
      //                     BorderRadius.circular(10),
      //                   ),
      //                 ),
      //               );
      //             },
      //           )),
      //     ),
      //     Visibility(
      //       visible: provider.selectedIndex == 1,
      //       child: SizedBox(
      //         height: 350,
      //         child: GridView.builder(
      //           padding: const EdgeInsets.all(5),
      //           gridDelegate:
      //           const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 3,
      //             childAspectRatio: 0.9,
      //           ),
      //           // physics:  NeverScrollableScrollPhysics(),
      //           itemCount: 4,
      //           itemBuilder:
      //               (BuildContext context, int index) {
      //             return Card(
      //               elevation: 5,
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   image: DecorationImage(
      //                     image: AssetImage(
      //                         "assets/bar-chart-grouped-fill.png"),
      //                   ),
      //                   color: Colors.white,
      //                   borderRadius:
      //                   BorderRadius.circular(10),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      //   ],
      // )
     
    );
  }
}

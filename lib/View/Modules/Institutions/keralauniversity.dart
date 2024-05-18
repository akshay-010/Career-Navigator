import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Users/homelistcourses.dart';

class KeralaUniversityPage extends StatefulWidget {
  const KeralaUniversityPage({super.key});

  @override
  State<KeralaUniversityPage> createState() => _KeralaUniversityPageState();
}

class _KeralaUniversityPageState extends State<KeralaUniversityPage> {
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
            "Kerala University",
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
                  indicator: const BubbleTabIndicator(indicatorColor: Colors.grey),
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
                  ListView.builder(
                    itemCount: popularcourses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset(popularcourses[index]['logo']),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              popularcourses[index]['course'],
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
                  GridView.builder(
                    itemCount: 10,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.54,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: height / 3.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: height / 8,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://tse3.mm.bing.net/th?id=OIP.LbHFILvdQ9s7GlRV6Ue65wHaHa&pid=Api&P=0&h=180"),
                                ),
                                border: Border.all(
                                    color: Colors.black,
                                    width: 3,
                                    strokeAlign: BorderSide.strokeAlignInside),
                              ),
                            ),
                            Text(
                              "Anikha stibin",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            const Text(
                              "Plus Two",
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  GridView.builder(
                    itemCount: 30,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.54,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
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
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://tse4.mm.bing.net/th?id=OIP.pFTfGP427BBYGeOvBNIbeQHaHa&pid=Api&P=0&h=180"),
                                ),
                              ),
                            ),
                            Text(
                              "Rohith k",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            const Text(
                              "UIUX Designer",
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      );
                    },
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

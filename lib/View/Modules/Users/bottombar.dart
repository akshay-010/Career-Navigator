// import 'package:careernavigator/Controller/Providers/userprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// class BottomBar extends StatelessWidget {
//   const BottomBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<UserProvider>(context);
//     return Scaffold(bottomNavigationBar: BottomNavigationBar(
//       backgroundColor: HexColor("#A527BC"),
//       items: [
//
//       BottomNavigationBarItem(icon: Icon(Icons.home),label: "",backgroundColor: HexColor("#A527BC"),),
//       BottomNavigationBarItem(icon: Icon(Icons.chat),label: "",backgroundColor: HexColor("#A527BC"),),
//       BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark_sharp),label: "",backgroundColor: HexColor("#A527BC"),),
//       BottomNavigationBarItem(icon: Icon(Icons.person),label: "",backgroundColor: HexColor("#A527BC"),),
//
//     ],showSelectedLabels: false,
//     currentIndex: provider.indexNum,
//       onTap:(index) {
//       provider.bottom(index);
//       },
//     ),
//     body: provider.bott.elementAt(provider.indexNum),
//     );
//   }
// }





import 'package:careernavigator/View/Modules/Users/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Controller/Providers/userprovider.dart';
import 'courses.dart';
import 'help.dart';
import 'home.dart';

class BottomBar extends StatelessWidget {
  static const List<Widget> _widgetOptions = <Widget>[
    Home_Page(),
    HelpPage(),
    Courses_Page(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _widgetOptions.elementAt(bottomNavProvider.selectedIndexx),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(colors: [ HexColor("#D10DA6"),HexColor("#8038ca"),],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight
                    ),
                    // color: HexColor("#2f3164").withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildNavItem(Icons.home, 'Home', 0, bottomNavProvider),
                      _buildNavItem(Icons.present_to_all_sharp, 'All', 1, bottomNavProvider),
                      _buildNavItem(Icons.category, 'Categoery', 2, bottomNavProvider),
                      _buildNavItem(Icons.person, 'Profile', 3, bottomNavProvider),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, UserProvider provider) {
    return GestureDetector(
      onTap: () {
        provider.setIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: provider.selectedIndexx == index ? Colors.black : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: provider.selectedIndexx == index ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

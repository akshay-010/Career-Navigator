// import 'package:careernavigator/Controller/Providers/userprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
//
// import '../../../Controller/Providers/counsellorbackendservice.dart';
// class CounsellorBottom extends StatelessWidget {
//   final String ownerId;
//   const CounsellorBottom({super.key,required this.ownerId});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<CounsellorService>(context);
//     return Scaffold(bottomNavigationBar: BottomNavigationBar(
//       backgroundColor: HexColor("#A527BC"),
//       items: [
//
//         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Profile",backgroundColor: HexColor("#A527BC"),),
//         BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Appointment",backgroundColor: HexColor("#A527BC"),),
//         BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark_sharp),label: "Notifications",backgroundColor: HexColor("#A527BC"),),
//         // BottomNavigationBarItem(icon: Icon(Icons.person),label: "",backgroundColor: HexColor("#A527BC"),),
//         // BottomNavigationBarItem(icon: Icon(Icons.person),label: "",backgroundColor: HexColor("#A527BC"),),
//
//       ],
//       selectedLabelStyle: TextStyle(color: Colors.white,),
//       selectedItemColor: Colors.white,
//       currentIndex: provider.indexNumber,
//       onTap:(index) {
//         provider.bottom(index);
//       },
//     ),
//       body: provider.bott.elementAt(provider.indexNumber),
//     );
//   }
// }









import 'package:careernavigator/Controller/Providers/counsellorbackendservice.dart';
import 'package:careernavigator/View/Modules/Counsellors/profile.dart';
import 'package:careernavigator/View/Modules/Users/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Controller/Providers/userprovider.dart';
import 'appointment.dart';
import 'notifications.dart';

class CounsellorBottom extends StatelessWidget {
  final String ownerId;
  const CounsellorBottom({Key? key, required this.ownerId}) : super(key: key);
  static const List<Widget> _widgetOptions = <Widget>[
    ProfilePage(),
    // Appointments(),
    Notificationss(),
    // Reporting()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<CounsellorService>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _widgetOptions.elementAt(bottomNavProvider.selectedIndexxo),
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
                      _buildNavItem(Icons.person, 'Profile', 0, bottomNavProvider),
                      // _buildNavItem(Icons.request_page, 'Appointments', 1, bottomNavProvider),
                      _buildNavItem(Icons.notifications, 'Notifications', 1, bottomNavProvider),
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

  Widget _buildNavItem(IconData icon, String label, int index, CounsellorService provider) {
    return GestureDetector(
      onTap: () {
        provider.setIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: provider.selectedIndexxo == index ? Colors.black : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: provider.selectedIndexxo == index ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

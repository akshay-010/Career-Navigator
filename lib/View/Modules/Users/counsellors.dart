
// first page in counsellor fetch  request but all select


// import 'package:careernavigator/Controller/Providers/userprovider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../Controller/adminbackendservices.dart';
// import '../../../Model/adminmodel.dart';
// import 'homelistcourses.dart';
//
// class Counsellors extends StatefulWidget {
//   const Counsellors({super.key});
//
//   @override
//   State<Counsellors> createState() => _CounsellorsState();
// }
//
// class _CounsellorsState extends State<Counsellors> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AdminBackend>(context);
//     final userpro = Provider.of<UserProvider>(context);
//
//     final hyt = MediaQuery.of(context).size.height;
//     final vdth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Counsellors",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: StreamBuilder<List<AdminAddCounsellor>>(
//             stream: provider.getCounsellorStream(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 print('Error: ${snapshot.error}');
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(child: Text('No institutions found'));
//               }
//
//               final counsellorList = snapshot.data!;
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: counsellorList.length,
//                   itemBuilder: (context, index) {
//                     final counsellor = counsellorList[index];
//
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)
//                         ),
//                         child: Container(
//                           width: vdth,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                               color: HexColor("65799B").withOpacity(0.5),
//                               border: Border.all(color: Colors.black.withOpacity(0.4))
//                               // gradient: LinearGradient(colors: [HexColor("65799B").withOpacity(0.5),HexColor("EA6060").withOpacity(0.4)],
//                               // begin:Alignment.centerRight,
//                               //   end: Alignment.bottomCenter
//                               // )
//                           ),
//                           child: ListTile(
//                             contentPadding: EdgeInsets.zero,
//                             leading: CircleAvatar(
//                                 radius: 43,
//                                 backgroundImage: counsellor.imageUrl.isNotEmpty
//                                     ? NetworkImage(counsellor.imageUrl)
//                                     : const AssetImage("assets/Ellipse 46.png")
//                                         as ImageProvider,
//                                 onBackgroundImageError: (exception, stackTrace) {
//                                   print('Image load error: $exception');
//                                 }),
//                             title: Text(
//                               counsellor.counsellorname,
//                               style: TextStyle(
//                                   fontFamily: GoogleFonts.poppins().fontFamily,
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis),
//                             ),
//                             subtitle: Text(
//                               counsellor.location,
//                               style: TextStyle(
//                                   fontFamily: GoogleFonts.poppins().fontFamily,
//                                   overflow: TextOverflow.ellipsis),
//                             ),
//                             trailing:
//                            Wrap(
//                              crossAxisAlignment: WrapCrossAlignment.center,
//                              children: [
//                                InkWell(
//                                  onTap: (){
//                                    userpro.toggleCard();
//                                  },
//                                  child: Card(
//                                    color:  userpro.isClicked ?
//                                    Colors.green :  HexColor("65799B").withOpacity(0.5),
//
//                                    shape: RoundedRectangleBorder(
//                                      side: BorderSide(color: Colors.black.withOpacity(0.6)),
//                                      borderRadius: BorderRadius.circular(4)
//                                    ),
//                                    elevation: 2,
//                                    child: Padding(
//                                      padding: const EdgeInsets.only(top: 3,bottom: 3,right: 7,left: 7),
//                                      child: Text(
//                                        userpro.isClicked ?
//                                        "Requested" : "Book", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.inter().fontFamily,fontSize: 13),)
//
//                                      // "Book",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.inter().fontFamily,fontSize: 13),),
//                                    )
//                                  ),
//                                ),
//                                IconButton(
//                                    onPressed: () {
//                                      Uri launchUri = Uri(
//                                        scheme: 'https',
//                                        host: 'api.whatsapp.com',
//                                        path: 'send',
//                                        queryParameters: {'phone': counsellor.phone},
//                                      );
//                                      launchUrl(launchUri);
//                                    },
//                                    icon: Icon(Icons.call)),
//                              ],
//                            )
//                           ),
//                         ),
//                       ),
//                     );
//                   });
//             }),
//       ),
//     );
//   }
// }






















// second try in request its done only one select two classes


//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../Controller/Providers/userprovider.dart';
// import '../../../Controller/adminbackendservices.dart';
// import '../../../Model/adminmodel.dart';
//
// class CounsellorCard extends StatefulWidget {
//   final AdminAddCounsellor counsellor;
//
//   const CounsellorCard({Key? key, required this.counsellor}) : super(key: key);
//
//   @override
//   _CounsellorCardState createState() => _CounsellorCardState();
// }
//
// class _CounsellorCardState extends State<CounsellorCard> {
//   bool _isClicked = false;
//
//   void _toggleCard() {
//     setState(() {
//       _isClicked = !_isClicked;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final userpro = Provider.of<UserProvider>(context);
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: HexColor("65799B").withOpacity(0.5),
//             border: Border.all(color: Colors.black.withOpacity(0.4)),
//           ),
//           child: ListTile(
//             contentPadding: EdgeInsets.zero,
//             leading: CircleAvatar(
//               radius: 43,
//               backgroundImage: widget.counsellor.imageUrl.isNotEmpty
//                   ? NetworkImage(widget.counsellor.imageUrl)
//                   : const AssetImage("assets/Ellipse 46.png") as ImageProvider,
//               onBackgroundImageError: (exception, stackTrace) {
//                 print('Image load error: $exception');
//               },
//             ),
//             title: Text(
//               widget.counsellor.counsellorname,
//               style: TextStyle(
//                 fontFamily: GoogleFonts.poppins().fontFamily,
//                 color: Colors.black,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             subtitle: Text(
//               widget.counsellor.location,
//               style: TextStyle(
//                 fontFamily: GoogleFonts.poppins().fontFamily,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             trailing: Wrap(
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: _toggleCard,
//                   child: Card(
//                     color: _isClicked
//                         ? Colors.green
//                         : HexColor("65799B").withOpacity(0.5),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(color: Colors.black.withOpacity(0.6)),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     elevation: 2,
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 3, bottom: 3, right: 7, left: 7),
//                       child: Text(
//                         _isClicked ? "Requested" : "Book",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700,
//                           fontFamily: GoogleFonts.inter().fontFamily,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     Uri launchUri = Uri(
//                       scheme: 'https',
//                       host: 'api.whatsapp.com',
//                       path: 'send',
//                       queryParameters: {'phone': widget.counsellor.phone},
//                     );
//                     launchUrl(launchUri);
//                   },
//                   icon: Icon(Icons.call),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Counsellors extends StatefulWidget {
//   const Counsellors({super.key});
//
//   @override
//   State<Counsellors> createState() => _CounsellorsState();
// }
//
// class _CounsellorsState extends State<Counsellors> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AdminBackend>(context);
//     final userpro = Provider.of<UserProvider>(context);
//
//     final hyt = MediaQuery.of(context).size.height;
//     final vdth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Counsellors",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: StreamBuilder<List<AdminAddCounsellor>>(
//             stream: provider.getCounsellorStream(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 print('Error: ${snapshot.error}');
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(child: Text('No institutions found'));
//               }
//
//               final counsellorList = snapshot.data!;
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: counsellorList.length,
//                   itemBuilder: (context, index) {
//                     final counsellor = counsellorList[index];
//                     return CounsellorCard(counsellor: counsellor);
//                   });
//             }),
//       ),
//     );
//   }
// }







      //third try its work request one  class and refresh page
//
// import 'package:careernavigator/Controller/Providers/userprovider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../Controller/adminbackendservices.dart';
// import '../../../Model/adminmodel.dart';
// import 'homelistcourses.dart';
//
// class Counsellors extends StatefulWidget {
//   const Counsellors({super.key});
//
//   @override
//   State<Counsellors> createState() => _CounsellorsState();
// }
//
// class _CounsellorsState extends State<Counsellors> {
//   final Map<String, bool> _isClickedMap = {};
//
//   void _toggleCard(String userId) {
//     setState(() {
//       _isClickedMap[userId] = !(_isClickedMap[userId] ?? false);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AdminBackend>(context);
//     final hyt = MediaQuery.of(context).size.height;
//     final vdth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#A527BC"),
//         title: Text(
//           "Counsellors",
//           style: GoogleFonts.poppins(
//               color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: StreamBuilder<List<AdminAddCounsellor>>(
//             stream: provider.getCounsellorStream(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 print('Error: ${snapshot.error}');
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               }
//               if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                 return Center(child: Text('No institutions found'));
//               }
//
//               final counsellorList = snapshot.data!;
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: counsellorList.length,
//                   itemBuilder: (context, index) {
//                     final counsellor = counsellorList[index];
//                     final isClicked = _isClickedMap[counsellor.userId] ?? false;
//
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Container(
//                           width: vdth,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: HexColor("65799B").withOpacity(0.5),
//                             border: Border.all(color: Colors.black.withOpacity(0.4)),
//                           ),
//                           child: ListTile(
//                               contentPadding: EdgeInsets.zero,
//                               leading: CircleAvatar(
//                                   radius: 43,
//                                   backgroundImage: counsellor.imageUrl.isNotEmpty
//                                       ? NetworkImage(counsellor.imageUrl)
//                                       : const AssetImage("assets/Ellipse 46.png")
//                                   as ImageProvider,
//                                   onBackgroundImageError: (exception, stackTrace) {
//                                     print('Image load error: $exception');
//                                   }),
//                               title: Text(
//                                 counsellor.counsellorname,
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.poppins().fontFamily,
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     overflow: TextOverflow.ellipsis),
//                               ),
//                               subtitle: Text(
//                                 counsellor.location,
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.poppins().fontFamily,
//                                     overflow: TextOverflow.ellipsis),
//                               ),
//                               trailing: Wrap(
//                                 crossAxisAlignment: WrapCrossAlignment.center,
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       _toggleCard(counsellor.userId);
//                                     },
//                                     child: Card(
//                                         color: isClicked
//                                             ? Colors.green
//                                             : HexColor("65799B").withOpacity(0.5),
//                                         shape: RoundedRectangleBorder(
//                                             side: BorderSide(
//                                                 color: Colors.black.withOpacity(0.6)),
//                                             borderRadius: BorderRadius.circular(4)),
//                                         elevation: 2,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 3, bottom: 3, right: 7, left: 7),
//                                           child: Text(
//                                             isClicked ? "Requested" : "Book",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.w700,
//                                                 fontFamily:
//                                                 GoogleFonts.inter().fontFamily,
//                                                 fontSize: 13),
//                                           ),
//                                         )),
//                                   ),
//                                   IconButton(
//                                       onPressed: () {
//                                         Uri launchUri = Uri(
//                                           scheme: 'https',
//                                           host: 'api.whatsapp.com',
//                                           path: 'send',
//                                           queryParameters: {
//                                             'phone': counsellor.phone
//                                           },
//                                         );
//                                         launchUrl(launchUri);
//                                       },
//                                       icon: Icon(Icons.call)),
//                                 ],
//                               )),
//                         ),
//                       ),
//                     );
//                   });
//             }),
//       ),
//     );
//   }
// }
//







//    request add collection and all perfect okeyyy



import 'package:careernavigator/Controller/Providers/userprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Controller/adminbackendservices.dart';
import '../../../Controller/backendservices.dart';
import '../../../Model/adminmodel.dart';
import '../../../Model/usermodel.dart';
import 'homelistcourses.dart';

class Counsellors extends StatefulWidget {
  const Counsellors({super.key});

  @override
  State<Counsellors> createState() => _CounsellorsState();
}

class _CounsellorsState extends State<Counsellors> {

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




  final Map<String, bool> _isClickedMap = {};

  void _toggleCard(String userId) {
    setState(() {
      _isClickedMap[userId] = !(_isClickedMap[userId] ?? false);
    });
  }

  Future<void> _handleCardClick(String userId,username,imageUrl) async {
    final provider = Provider.of<AdminBackend>(context, listen: false);
    _toggleCard(userId);
    await provider.addRequestToCounsellor(userId,'Request message here $username',username,imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminBackend>(context);
    final hyt = MediaQuery.of(context).size.height;
    final vdth = MediaQuery.of(context).size.width;



    String? userId = FirebaseAuth.instance.currentUser?.uid;

    UserRegistration? currentUserRegistration = registrations?.firstWhere(
          (registration) => registration.userid == userId,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Counsellors",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder<List<AdminAddCounsellor>>(
            stream: provider.getCounsellorStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No institutions found'));
              }

              final counsellorList = snapshot.data!;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: counsellorList.length,
                  itemBuilder: (context, index) {
                    final counsellor = counsellorList[index];
                    final isClicked = _isClickedMap[counsellor.userId] ?? false;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          width: vdth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: HexColor("65799B").withOpacity(0.5),
                            border: Border.all(color: Colors.black.withOpacity(0.4)),
                          ),
                          child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                  radius: 43,
                                  backgroundImage: counsellor.imageUrl.isNotEmpty
                                      ? NetworkImage(counsellor.imageUrl)
                                      : const AssetImage("assets/Ellipse 46.png")
                                  as ImageProvider,
                                  onBackgroundImageError: (exception, stackTrace) {
                                    print('Image load error: $exception');
                                  }),
                              title: Text(
                                counsellor.counsellorname,
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              subtitle: Text(
                                counsellor.location,
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              trailing: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await _handleCardClick(counsellor.userId,currentUserRegistration?.Name ?? '', currentUserRegistration?.imageUrl??'');
                                    },
                                    child: Card(
                                        color: isClicked
                                            ? Colors.green
                                            : HexColor("65799B").withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.black.withOpacity(0.6)),
                                            borderRadius: BorderRadius.circular(4)),
                                        elevation: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, bottom: 3, right: 7, left: 7),
                                          child: Text(
                                            isClicked ? "Requested" : "Book",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                                fontSize: 13),
                                          ),
                                        )),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Uri launchUri = Uri(
                                          scheme: 'https',
                                          host: 'api.whatsapp.com',
                                          path: 'send',
                                          queryParameters: {
                                            'phone': counsellor.phone
                                          },
                                        );
                                        launchUrl(launchUri);
                                      },
                                      icon: Icon(Icons.call)),
                                ],
                              )),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

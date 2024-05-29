import 'dart:io';

import 'package:careernavigator/View/Modules/Users/viewprofile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Controller/backendservices.dart';
import '../../../Model/usermodel.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BackendServices>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: FutureBuilder<List<UserRegistration>>(
          future: provider.fetchRegistrations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<UserRegistration>? registrations = snapshot.data;

              return ListView.builder(
                  itemCount: registrations!.length,
                  itemBuilder: (context, index) {
                    final registration = registrations[index];
                    return Column(
                      children: [
                        Container(
                          height: height / 4.5,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      registration.imageUrl.toString()),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      registration.Name,
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),SizedBox(height: 5,),
                                    Text(
                                      registration.Qualification,
                                      style: GoogleFonts.radioCanada(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                TextButton(
                                    onPressed: () async {
                                      final pickedFile = await ImagePicker()
                                          .pickImage(
                                          source: ImageSource.gallery);
                                      if (pickedFile != null) {
                                        setState(() {
                                          _image = File(pickedFile.path);
                                        });
                                        provider.insertImage(
                                            registration.userid, _image);
                                      }
                                    },
                                    child: Text("Add Image")),
                                SizedBox(width: 20,)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfile()));
                                  },
                                  child: ListTile(
                                    leading:
                                        Image.asset("assets/Vector (6).png"),
                                    title: Text(
                                      "My Profile",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: HexColor("#A527BC"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ListTile(
                                    leading:
                                        Image.asset("assets/Vector (7).png"),
                                    title: Text(
                                      "Settings",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: HexColor("#A527BC"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ListTile(
                                    leading:
                                        Image.asset("assets/Vector (8).png"),
                                    title: Text(
                                      "Help Center",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: HexColor("#A527BC"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ListTile(
                                    leading:
                                        Image.asset("assets/Vector (9).png"),
                                    title: Text(
                                      "Intive Friends",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: HexColor("#A527BC"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.showLogoutDialog(context);
                                  },
                                  child: ListTile(
                                    leading:
                                        Image.asset("assets/Vector (10).png"),
                                    title: Text(
                                      "Logout",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: HexColor("#A527BC"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  });
            }
          }),
    );
  }
}

//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:careernavigator/Controller/backendservices.dart';
// import 'package:careernavigator/Model/usermodel.dart';
//
// class RegistrationListPage extends StatefulWidget {
//   @override
//   _RegistrationListPageState createState() => _RegistrationListPageState();
// }
//
// class _RegistrationListPageState extends State<RegistrationListPage> {
//   File? _image;
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<BackendServices>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Registrations'),
//       ),
//       body: FutureBuilder<List<UserRegistration>>(
//         future: provider.fetchRegistrations(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             List<UserRegistration>? registrations = snapshot.data;
//             return ListView.builder(
//               itemCount: registrations!.length,
//               itemBuilder: (context, index) {
//                 final registration = registrations[index];
//                 return Column(
//                   children: [
//                     ListTile(
//                       title: Text(registration.Name),
//                       subtitle: Text(registration.Qualification),
//                       trailing: IconButton(
//                         icon: Icon(Icons.add_a_photo),
//                         onPressed: () async {
//                           final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//                           if (pickedFile != null) {
//                             setState(() {
//                               _image = File(pickedFile.path);
//                             });
//                             // Now you can insert the selected image into the user registration collection
//                             provider.insertImage(registration.userid, _image);
//                           }
//                         },
//                       ),
//                     ),
//                     CircleAvatar(
//                       backgroundImage: NetworkImage(registration.imageUrl.toString()),
//                     )
//                   ],
//                 );
// },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//

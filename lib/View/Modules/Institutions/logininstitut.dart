import 'package:careernavigator/Controller/Providers/userprovider.dart';
import 'package:careernavigator/Controller/institutionbackend.dart';
import 'package:careernavigator/View/Modules/Institutions/addfaculty.dart';
import 'package:careernavigator/View/Modules/Institutions/addinstitution.dart';
import 'package:careernavigator/View/Modules/Institutions/university.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';

import '../Users/forgotpassword.dart';
import '../Users/registration.dart';

class LoginInstitution extends StatefulWidget {
  LoginInstitution({super.key});

  @override
  State<LoginInstitution> createState() => _LoginInstitutionState();
}

class _LoginInstitutionState extends State<LoginInstitution> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passlgn = false;

  //
  // String _errorMessage = '';
  //
  // // Function to handle login button press
  // void _login() async {
  //   String email = _emailController.text.trim();
  //   String password = _passwordController.text.trim();
  //
  //   AuthService authService = AuthService(); // Create an instance of AuthService
  //   String? result = await authService.login(email, password);
  //
  //   setState(() {
  //     _errorMessage = result ?? 'Login failed';
  //   });
  //
  //   if (_errorMessage == "Login successful") {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => AddFaculties()), // Adjust destination as needed
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(_errorMessage)),
  //     );
  //   }}

  var pass = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // var _tabController;

    final provider = Provider.of<UserProvider>(context);
    // final instiprovider = Provider.of<InstitutionBackend>(context);

    // AuthService authService = AuthService();
    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Container(
            height: height / 2,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                HexColor("#D10DA6"),
                HexColor("#8038ca"),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome",
                  style: GoogleFonts.poppins(
                      color: HexColor("#FFFCFC"),
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Sign Up to Continue',
                  style: GoogleFonts.kreon(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Or Signin With",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width / 3.4,
                      height: 40,
                      decoration: BoxDecoration(
                          color: HexColor("#3C5899"),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/Facebook F.png",
                            scale: 1.16,
                          ),
                          Text(
                            "Facebook",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12.6),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width / 3.4,
                      height: 40,
                      decoration: BoxDecoration(
                          color: HexColor("#DB4D41"),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/Google Plus.png",
                            scale: 1.16,
                          ),
                          Text(
                            "Google",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12.6),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          )
        ],
      ),
      Align(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: height * 0.43,
                  width: width,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Container(
                              height: height * 0.38,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: emailController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.green)),
                                          prefixIcon:
                                              Icon(Icons.email_outlined),
                                          hintText: "E-mail",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: !passlgn,
                                        obscuringCharacter: '-',
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.green)),
                                          prefixIcon: Icon(Icons.lock_outline),
                                          hintText: "Password",
                                            suffixIcon: IconButton(onPressed: (){
                                              setState(() {
                                                passlgn=!passlgn;
                                              });
                                            },icon: Icon(passlgn? Icons.visibility: Icons.visibility_off),)
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Transform.scale(
                                                scale: 0.6,
                                                child: Checkbox(
                                                    splashRadius: 0.2,
                                                    value: provider.pass,
                                                    onChanged: (val) {
                                                      provider.checkbox();
                                                    }),
                                              ),
                                              Text(
                                                "Remember Password",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Forgot_Pass()));
                                              },
                                              child: Text(
                                                "Forgot Password?",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: 10),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10,
                                  spreadRadius: 0.4,
                                  offset: Offset(0, 8))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      HexColor("#F95715"),
                                      HexColor("#FF864E")
                                    ])),
                                child: Center(
                                  child: IconButton(
                                      onPressed: () async {
                                        try {
                                          final UserCredential userCredential =
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );

                                          // Get the user ID of the logged-in owner
                                          final String ownerId =
                                              userCredential.user!.uid;

                                          // If login is successful, navigate to the InstitutionOwnerPage and pass the ownerId
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UniversityPage(
                                                      ownerId: ownerId),
                                            ),
                                          );
                                        } catch (e) {
                                          print('Login error: $e');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text('Login failed: $e')),
                                          );
                                        }
                                      },

                                      // onPressed: () {
                                      //   _login();
                                      //   if (_errorMessage.isNotEmpty)
                                      //     Text(
                                      //       _errorMessage,
                                      //       style: TextStyle(color: Colors.red),
                                      //     );
                                      // authService.login(_emailController.text, _passwordController.text);
                                      // if (_errorMessage.isNotEmpty)
                                      //   Text(
                                      //     _errorMessage,
                                      //     style: TextStyle(color: Colors.red),
                                      //   );
                                      // authService.login(_emailController.text, _passwordController.text);

                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Registration_Page()));

                                      // },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))))
    ]));
  }
}

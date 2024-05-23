import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Controller/adminbackendservices.dart';
class AddAdminInstitutions extends StatelessWidget {
  const AddAdminInstitutions({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<AdminBackend>(context);

    return

          Padding(
           padding: const EdgeInsets.symmetric(horizontal: 40),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Add Institustions",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily),),
                          )),
                      SizedBox(
                        width: 20,
                      ),

                      InkWell(
                        onTap: (){provider.pickImageInstitution(ImageSource.gallery);},
                        child:
                        provider.image == null && provider.webImage == null ?Icon(Icons.image,size: 45,):
                        Container(
                          height: 50,width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(

                                image:  provider.webImage != null? MemoryImage(provider.webImage!) : FileImage(provider.image!) as ImageProvider,
                                fit: BoxFit.cover
                                // FileImage(provider.image!)
                            )
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),

              Text(
                "Institustions name",
                style: TextStyle(
                    color: HexColor("#323A46"),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(
                height:  4,
              ),
              TextFormField(
                controller: provider.institutionnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191"))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191")))),
              ),  SizedBox(
                height: height*0.025,
              ),
              Text(
                "Manager name",
                style: TextStyle(
                    color: HexColor("#323A46"),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(
                height:  4,
              ),
              TextFormField(
                controller: provider.managernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191"))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191")))),
              ),
              SizedBox(
                height: height*0.025,
              ),
              Text(
                "Email",
                style: TextStyle(
                    color: HexColor("#323A46"),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(
                height:  4,
              ),
              TextFormField(
                controller: provider.emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191"))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191")))),
              ),
              SizedBox(
                height: height*0.025,
              ),
              Text(
                "Phone",
                style: TextStyle(
                    color: HexColor("#323A46"),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(
                height:  4,
              ),
              TextFormField(
                controller: provider.phoneController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191"))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191")))),
              ),
              SizedBox(
                height: height*0.025,
              ),
              Text(
                "Location",
                style: TextStyle(
                    color: HexColor("#323A46"),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(
                height:  4,
              ),
              TextFormField(
                controller: provider.locationController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191"))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191")))),
              ),
              SizedBox(
                height: height*0.025,
              ),
              Text(
                "Password",
                style: TextStyle(
                    color: HexColor("#323A46"),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: provider.passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: 5),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191"))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: HexColor("#B49191")))),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 75, right: 75,),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 2)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                        minimumSize: const MaterialStatePropertyAll(Size(0, 50)),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red;
                          }
                          return HexColor("#3568FF");
                        },
                      ),),
                  onPressed: () async {
                    // Validate if all fields are filled
                    if (provider.emailController.text.isEmpty ||
                        provider.passwordController.text.isEmpty ||
                        provider.institutionnameController.text.isEmpty ||
                        provider.managernameController.text.isEmpty ||
                        provider.phoneController.text.isEmpty ||
                        provider.locationController.text.isEmpty ||
                        (provider.image == null && provider.webImage == null)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all fields and select an image')),
                      );
                      return;
                    }

                    try {
                      // Upload the image
                      String imageUrl = await provider.storeImageToStorage(
                        'institutionimages/${provider.institutionnameController.text}',
                      );

                      // Add the institution


                      // Clear institution-related text fields after successful addition


                      // Show success message for institution addition
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Institution successfully added')),
                      );

                      // Attempt to create a new user with the provided email and password
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: provider.emailController.text,
                        password: provider.passwordController.text,
                      ).then((value) {
                        provider.addInstitution(
                          provider.institutionnameController.text,
                          provider.managernameController.text,
                          provider.emailController.text,
                          provider.phoneController.text,
                          provider.locationController.text,
                          provider.passwordController.text,
                          imageUrl,
                          value.user!.uid
                        );
                      });

                      // Clear email and password fields after successful user creation
                      provider.emailController.clear();
                      provider.passwordController.clear();
                      provider.institutionnameController.clear();
                      provider.managernameController.clear();
                      provider.phoneController.clear();
                      provider.locationController.clear();

                      // Show success message for user creation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User created successfully')),
                      );
                    } catch (e) {
                      // Handle any errors that occur during user creation
                      print('Error creating user: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error creating user: $e')));

                          // Store the email and password securely for later use
                          final storage = FlutterSecureStorage();
                      await storage.write(
                          key: 'institution_owner_email',
                          value: provider.emailController.text);
                      await storage.write(
                          key: 'institution_owner_password',
                          value: provider.passwordController.text);

                      // Clear text fields after storing the email and password
                      provider.emailController.clear();
                      provider.passwordController.clear();
                    }
                  },



                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              )
            ],
                 ),
         );


  }
}

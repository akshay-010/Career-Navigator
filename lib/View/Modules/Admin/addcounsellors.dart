import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Controller/adminbackendservices.dart';
class AddCounsellorsAdmin extends StatefulWidget {
  const AddCounsellorsAdmin({super.key});

  @override
  State<AddCounsellorsAdmin> createState() => _AddCounsellorsAdminState();
}

class _AddCounsellorsAdminState extends State<AddCounsellorsAdmin> {
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
                child:  Row(
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
                          child: Text("Add Counsellor",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily),),
                        )),
                    SizedBox(
                      width: 20,
                    ),

                    InkWell(
                      onTap: (){provider.pickImageCounsellor(ImageSource.gallery);},
                      child:
                      provider.imagess == null && provider.webImagess == null ?Icon(Icons.image,size: 55,):
                      Container(
                        height: 50,width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:  provider.webImagess != null? MemoryImage(provider.webImagess!) : FileImage(provider.imagess!) as ImageProvider,
                              fit: BoxFit.cover
                              // image:FileImage(provider.imageso!)
                            )
                        ),
                      ),
                    )
                  ],
                ),),
             SizedBox(
              height: 15,
            ),
            Text(
              "Name",
              style: TextStyle(
                  color: HexColor("#323A46"),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: provider.counsellornameController,
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
              "Phone",
              style: TextStyle(
                  color: HexColor("#323A46"),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: provider.phonenumController,
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
              height: 5,
            ),
            TextFormField(
              controller: provider.emailllController,
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
              "Age",
              style: TextStyle(
                  color: HexColor("#323A46"),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: provider.ageeeController,
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
              height: 5,
            ),
            TextFormField(
              controller: provider.locationsController,
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
              height: 5,
            ),
            TextFormField(
              controller: provider.passworddController,
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
            ),Spacer(),
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
                        },)),


                    onPressed: () async {
                      // Validate if all fields are filled
                      if (provider.counsellornameController.text.isEmpty ||
                          provider.phonenumController.text.isEmpty ||
                          provider.emailllController.text.isEmpty ||
                          provider.ageeeController.text.isEmpty ||
                          provider.locationsController.text.isEmpty ||
                          provider.passworddController.text.isEmpty ||
                          (provider.imagess == null && provider.webImagess == null)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill in all fields and select an image')),
                        );
                        return;
                      }

                      try {
                        // Upload the image
                        String imageUrl = await provider.storeImageToCounsellor(
                          'counsellorimages/${provider.counsellornameController.text}',
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
                          email: provider.emailllController.text,
                          password: provider.passworddController.text,
                        ).then((value) {
                          provider.addCounsellor(
                              provider.counsellornameController.text,
                              provider.phonenumController.text,
                              provider.emailllController.text,
                              provider.ageeeController.text,
                              provider.locationsController.text,
                              provider.passworddController.text,
                              imageUrl,
                              value.user!.uid
                          );
                        });

                        // Clear email and password fields after successful user creation
                        provider.counsellornameController.clear();
                    provider.phonenumController.clear();
                    provider.emailllController.clear();
                    provider.ageeeController.clear();
                    provider.locationsController.clear();
                    provider.passworddController.clear();


                        // Show success message for user creation
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('User created successfully')),
                        );
                      } catch (e) {
                        // Handle any errors that occur during user creation
                        print('Error creating user: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error creating user: $e')));

                        // Store the email and password securely for later use
                        final storage = FlutterSecureStorage();
                        await storage.write(
                            key: 'counsellor_owner_email',
                            value: provider.emailllController.text);
                        await storage.write(
                            key: 'icounsellor_owner_password',
                            value: provider.passworddController.text);

                        // Clear text fields after storing the email and password
                        provider.emailllController.clear();
                        provider.passworddController.clear();
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

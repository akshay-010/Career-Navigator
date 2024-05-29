import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Controller/adminbackendservices.dart';
class AddEntranceExam extends StatelessWidget {
  const AddEntranceExam({super.key});

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
                child:
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Add Entrance Exam",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily),),
                        )),
                ),
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
              controller: provider.examnameController,
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
              controller: provider.aboutexamController,
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
                    provider.addEntreaneExam(provider.examnameController.text, provider.aboutexamController.text,);
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

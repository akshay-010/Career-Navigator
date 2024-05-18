import 'package:flutter/material.dart';
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
                    Text("Add Institustions",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700,fontFamily: GoogleFonts.poppins().fontFamily),),
                    SizedBox(
                      width: 20,
                    ),

                    InkWell(
                      onTap: (){provider.pickImageCounsellor(ImageSource.gallery);},
                      child:
                      provider.imageso == null ?Column(
                        children: [
                          Icon(Icons.image,size: 25,),
                        ],
                      ):
                      Container(
                        height: 50,width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image:FileImage(provider.imageso!) )
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
                      backgroundColor:
                      MaterialStatePropertyAll(HexColor("#3568FF"))),
                  onPressed: () {},
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

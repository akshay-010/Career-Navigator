import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: HexColor("#FFFCFC"),
              child: Center(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      size: 18,
                    )),
              ),
            ),
          ),
          backgroundColor: HexColor("#A527BC"),
          title: Text(
            "Feedback",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  maxLines: 10,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: HexColor("#A527BC"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Typing...",
                      hintStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.5))),
                ),
              ),
              SizedBox(
                height: height / 9,
              ),
              CircleAvatar(
                radius: width * 0.066,
                backgroundColor: HexColor("#F95715"),
                child: Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: width * 0.07,
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

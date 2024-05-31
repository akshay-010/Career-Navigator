import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.sd_card_alert,
                color: Colors.white,
              ))
        ],
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Requests",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 13,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "data:image/jpeg;base64,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"),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 35, bottom: 5),
                    child: Text(
                      "Amelia",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size(25, 10)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0))),
                              backgroundColor: MaterialStatePropertyAll(
                                HexColor("#A527BC"),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Accept",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size(25, 10)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0))),
                              backgroundColor: MaterialStatePropertyAll(
                                HexColor("#FF1616"),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Reject",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                    ],
                  ),
                  trailing: Text(
                    "9.56 AM",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 12),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

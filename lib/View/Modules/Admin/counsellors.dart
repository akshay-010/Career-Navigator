import 'package:careernavigator/Model/adminmodel.dart';
import 'package:careernavigator/View/Modules/Users/homelistcourses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Controller/adminbackendservices.dart';

class CounsellorssAdmin extends StatelessWidget {
  const CounsellorssAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminBackend>(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            "Consellors",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
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
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage: counsellor.imageUrl.isNotEmpty
                                    ? NetworkImage(counsellor.imageUrl)
                                    : const AssetImage("assets/Ellipse 46.png")
                                        as ImageProvider,
                                onBackgroundImageError: (exception, stackTrace) {
                                  print('Image load error: $exception');
                                }),
                            title: SizedBox(
                                child: Text(
                              counsellor.counsellorname,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            )),
                            subtitle: Text(
                              counsellor.location,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: SizedBox(
                                  width: 100,
                                  child: Text(
                                    counsellor.phone,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black,
                                        fontSize: 15),
                                  )),
                            ),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Controller/adminbackendservices.dart';
import '../../../Model/adminmodel.dart';

class InstitutionAdmin extends StatefulWidget {
  const InstitutionAdmin({super.key});

  @override
  State<InstitutionAdmin> createState() => _InstitutionAdminState();
}

class _InstitutionAdminState extends State<InstitutionAdmin> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<AdminBackend>(context);

    return  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Institutions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: StreamBuilder<List<AdminAddInstitution>>(
                stream: provider.getInstitutionsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    print('Error: ${snapshot.error}');
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No institutions found'));
                  }

                  final institutionsList = snapshot.data!;
                  return ListView.builder(
                    itemCount: institutionsList.length,
                    itemBuilder: (context, index) {
                      final institution = institutionsList[index];
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: institution.imageUrl.isNotEmpty
                                ? NetworkImage(institution.imageUrl)
                                : AssetImage("assets/Ellipse 46.png")
                            as ImageProvider,
                            onBackgroundImageError: (exception, stackTrace) {
                              print('Image load error: $exception');
                            },
                          ),
                          title: SizedBox(
                            width: 200,
                            child: Text(
                              institution.institutionname,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: SizedBox(
                              width: 100,
                              child: Text(
                                institution.location,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.5,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );

  }
}

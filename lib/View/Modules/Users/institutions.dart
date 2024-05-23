import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Controller/adminbackendservices.dart';
import '../../../Model/adminmodel.dart';
import 'homelistcourses.dart';
import 'keralauniversity.dart';

class InstitutionsPage extends StatefulWidget {
  const InstitutionsPage({super.key});

  @override
  State<InstitutionsPage> createState() => _InstitutionsPageState();
}

class _InstitutionsPageState extends State<InstitutionsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final provider = Provider.of<AdminBackend>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#A527BC"),
        title: Text(
          "Institutions",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<AdminAddInstitution>>(
            stream: provider.getInstitutionsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
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
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KeralaUniversity(
                                    institution: institution)));
                      },
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
                        title: Text(institution.institutionname),
                        subtitle: Text(institution.location),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

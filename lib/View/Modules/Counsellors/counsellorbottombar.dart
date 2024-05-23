import 'package:careernavigator/Controller/Providers/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Providers/counsellorbackendservice.dart';
class CounsellorBottom extends StatelessWidget {
  final String ownerId;
  const CounsellorBottom({super.key,required this.ownerId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounsellorService>(context);
    return Scaffold(bottomNavigationBar: BottomNavigationBar(
      backgroundColor: HexColor("#A527BC"),
      items: [

        BottomNavigationBarItem(icon: Icon(Icons.home),label: "",backgroundColor: HexColor("#A527BC"),),
        BottomNavigationBarItem(icon: Icon(Icons.chat),label: "",backgroundColor: HexColor("#A527BC"),),
        BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark_sharp),label: "",backgroundColor: HexColor("#A527BC"),),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "",backgroundColor: HexColor("#A527BC"),),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "",backgroundColor: HexColor("#A527BC"),),

      ],showSelectedLabels: false,
      currentIndex: provider.indexNumber,
      onTap:(index) {
        provider.bottom(index);
      },
    ),
      body: provider.bott.elementAt(provider.indexNumber),
    );
  }
}

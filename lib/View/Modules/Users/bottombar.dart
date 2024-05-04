import 'package:careernavigator/Controller/Providers/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Scaffold(bottomNavigationBar: BottomNavigationBar(
      backgroundColor: HexColor("#A527BC"),
      items: [

      BottomNavigationBarItem(icon: Icon(Icons.home),label: "",backgroundColor: HexColor("#A527BC"),),
      BottomNavigationBarItem(icon: Icon(Icons.chat),label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark_sharp),label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),

    ],showSelectedLabels: false,
    currentIndex: provider.indexNum,
      onTap:(index) {
      provider.bottom(index);
      },
    ),
    body: provider.bott.elementAt(provider.indexNum),
    );
  }
}

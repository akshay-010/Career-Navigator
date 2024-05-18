import 'package:careernavigator/View/Modules/Users/courses.dart';
import 'package:careernavigator/View/Modules/Users/help.dart';
import 'package:careernavigator/View/Modules/Users/home.dart';
import 'package:careernavigator/View/Modules/Users/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  var indexNum = 0;
  List bott = [
    Home_Page(),
    HelpPage(),
    Courses_Page(),
    Profile(),
  ];
  void bottom(int index) {
    indexNum = index;
    notifyListeners();
  }

  bool pass = false;
  void checkbox() {
    pass = !pass;
    notifyListeners();
  }

  var selectedIndex =0;
  void tab(){
    selectedIndex =0;
    notifyListeners();
  }
  void tab1(){
    selectedIndex =1;
    notifyListeners();
  }
  void tab2(){
    selectedIndex =2;
    notifyListeners();
  }
  void tab3(){
    selectedIndex =3;
    notifyListeners();
  }
  void tab4(){
    selectedIndex =4;
    notifyListeners();
  }

}

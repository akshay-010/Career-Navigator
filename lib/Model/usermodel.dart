import 'package:flutter/material.dart';

class UserModel {
  String userid;
  String email;
  // String? Name;
  // String? Qualification;
  // String? Gender;
  // String? Number;
  UserModel({
    required this.userid,
    required this.email,
     // this.Name,
     // this.Qualification,
     // this.Gender,
     // this.Number,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userid: map['userid'],
        email: map['email'],);
        // Name: map['Name'],
        // Qualification: map['Qualification'],
        // Gender: map['Gender'],
        // Number: map['Number']);
  }
  Map<String, dynamic> toMap() {
    return {
      'userid':userid,
      'email': email,
      // 'Name': Name,
      // 'Qualification': Qualification,
      // 'Gender': Gender,
      // 'Number': Number
    };
  }
}





class UserRegistration {
  String userid;
  String Name;
  String Qualification;
  String Gender;
  String emaill;
  String Number;
  String ?imageUrl;
  UserRegistration({
    required this.userid,
    required this.Name,
    required this.Qualification,
    required this.Gender,
    required this.emaill,
    required this.Number,
    this.imageUrl
  });

  factory UserRegistration.fromMap(Map<String, dynamic> map) {
    return UserRegistration(
      userid: map['userid'],
    Name: map['Name'],
    Qualification: map['Qualification'],
    Gender: map['Gender'],
      emaill: map['emaill'],
    Number: map['Number'],
    imageUrl: map['imageUrl']);
  }
  Map<String, dynamic> toMap() {
    return {
      'userid':userid,
      'Name': Name,
      'Qualification': Qualification,
      'Gender': Gender,
      'emaill': emaill,
      'Number': Number,
      'imageUrl': imageUrl,
    };
  }

}




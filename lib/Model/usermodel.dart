import 'package:flutter/material.dart';

class UserModel {
  String userid;
  String email;
  String? Name;
  String? Qualification;
  String? Gender;
  String? Number;
  UserModel({
    required this.userid,
    required this.email,
     this.Name,
     this.Qualification,
     this.Gender,
     this.Number,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userid: map['userid'],
        email: map['email'],
        Name: map['Name'],
        Qualification: map['Qualification'],
        Gender: map['Gender'],
        Number: map['Number']);
  }
  Map<String, dynamic> toMap() {
    return {
      'userid':userid,
      'email': email,
      'Name': Name,
      'Qualification': Qualification,
      'Gender': Gender,
      'Number': Number
    };
  }
}

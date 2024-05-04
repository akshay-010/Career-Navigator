import 'package:flutter/material.dart';

class UserModel {
  String email;
  String Name;
  String Qualification;
  String Gender;
  String Number;
  UserModel({
    required this.email,
    required this.Name,
    required this.Qualification,
    required this.Gender,
    required this.Number,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        Name: map['Name'],
        Qualification: map['Qualification'],
        Gender: map['Gender'],
        Number: map['Number']);
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'Name': Name,
      'Qualification': Qualification,
      'Gender': Gender,
      'Number': Number
    };
  }
}

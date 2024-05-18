import 'package:flutter/material.dart';

class AdminAddInstitution {
  String institutionname;
  String managername;
  String email;
  String phone;
  String location;
  String password;

  AdminAddInstitution({
    required this.institutionname,
    required this.managername,
    required this.email,
    required this.phone,
    required this.location,
    required this.password,

  });

  factory AdminAddInstitution.fromMap(Map<String, dynamic> map) {
    return AdminAddInstitution(
      institutionname: map['institutionname'],
      managername: map['managername'],
      email: map['email'],
      phone: map['phone'],
      location: map['location'],
      password: map['password'],

    );

  }
  Map<String, dynamic> toMap() {
    return {
      'institutionname':institutionname,
      'managername': managername,
      'email': email,
      'phone': phone,
      'location': location,
      'password': password,

    };
  }
}

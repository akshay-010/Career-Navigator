import 'package:flutter/material.dart';

class AdminAddInstitution {
  String userId;
  String institutionname;
  String managername;
  String email;
  String phone;
  String location;
  String password;
  String imageUrl;

  AdminAddInstitution({
    required this.userId,
    required this.institutionname,
    required this.managername,
    required this.email,
    required this.phone,
    required this.location,
    required this.password,
    required this.imageUrl,

  });

  factory AdminAddInstitution.fromMap(Map<String, dynamic> map) {
    return AdminAddInstitution(
      userId: map['userId'],
      institutionname: map['institutionname'],
      managername: map['managername'],
      email: map['email'],
      phone: map['phone'],
      location: map['location'],
      password: map['password'],
      imageUrl : map['imageUrl'],

    );

  }
  Map<String, dynamic> toMap() {
    return {
      'userId':userId,
      'institutionname':institutionname,
      'managername': managername,
      'email': email,
      'phone': phone,
      'location': location,
      'password': password,
      'imageUrl' :  imageUrl,
    };
  }
}






class AdminAddCounsellor {
  String userId;
  String counsellorname;
  String phone;
  String email;
  String age;
  String location;
  String password;
  String imageUrl;

  AdminAddCounsellor({
    required this.userId,
    required this.counsellorname,
    required this.phone,
    required this.email,
    required this.age,
    required this.location,
    required this.password,
    required this.imageUrl,

  });

  factory AdminAddCounsellor.fromMap(Map<String, dynamic> map) {
    return AdminAddCounsellor(
      userId : map['userId'],
      counsellorname : map['counsellorname'],
      phone: map['phone'],
      email: map['email'],
      age: map['age'],
      location: map['location'],
      password: map['password'],
      imageUrl: map['String imageUrl'],

    );

  }
  Map<String, dynamic> toMap() {
    return {
      'userId':userId,
      'counsellorname':counsellorname,
      'phone': phone,
      'email': email,
      'age': age,
      'location': location,
      'password': password,
      'imageUrl' :  imageUrl,

    };
  }
}






class AdmEntrance {
  String userId;
  String examname;
  String examabout;


  AdmEntrance({
    required this.userId,
    required this.examname,
    required this.examabout,

  });

  factory AdmEntrance.fromMap(Map<String, dynamic> map) {
    return AdmEntrance(
      userId: map['userId'],
      examname: map['examname'],
      examabout: map['examabout'],

    );

  }
  Map<String, dynamic> toMap() {
    return {
      'userId':userId,
      'examname':examname,
      'examabout': examabout,
    };
  }
}

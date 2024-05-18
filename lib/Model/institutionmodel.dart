
class InstituionModel {
  String userid;
  String email;

  InstituionModel({
    required this.userid,
    required this.email,

  });

  factory InstituionModel.fromMap(Map<String, dynamic> map) {
    return InstituionModel(
        userid: map['userid'],
        email: map['email'],);

    }
  Map<String, dynamic> toMap() {
    return {
      'userid':userid,
      'email': email,

    };
  }
}




class InstitutionDetails {
  // String id;
  String name;
  String managerName;
  String email;
  String location;
  String phone;
  String about;
  String imageUrl;

  InstitutionDetails({
    // required this.id,
    required this.name,
    required this.managerName,
    required this.email,
    required this.location,
    required this.phone,
    required this.about,
    required this.imageUrl,
  });

  factory InstitutionDetails.fromMap(Map<String, dynamic> map) {
    return InstitutionDetails(
      // id: map['id'],
      name: map['name'],
      managerName: map['managerName'],
      email: map['email'],
      location: map['location'],
      phone: map['phone'],
      about: map['about'],
      imageUrl: map['imageUrl'],

    );

  }
  Map<String, dynamic> toMap() {
    return {
      // 'id':id,
      'name': name,
      'managerName': managerName,
      'email': email,
      'location': location,
      'phone': phone,
      'about': about,
      'imageUrl': imageUrl,

    };
  }
}
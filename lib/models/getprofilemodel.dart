// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    this.success,
    this.userValue,
  });

  bool success;
  UserValue userValue;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        success: json["success"],
        userValue: UserValue.fromJson(json["userValue"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "userValue": userValue.toJson(),
      };
}

class UserValue {
  UserValue({
    this.id,
    this.name,
    this.email,
    this.phonenumber,
    this.passwordText,
    this.designation,
    this.image,
    this.status,
    this.createdAt,
  });

  int id;
  String name;
  String email;
  String phonenumber;
  String passwordText;
  String designation;
  String image;
  int status;
  DateTime createdAt;

  factory UserValue.fromJson(Map<String, dynamic> json) => UserValue(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        passwordText: json["password_text"],
        designation: json["designation"],
        image: json["image"] ?? '',
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phonenumber": phonenumber,
        "password_text": passwordText,
        "designation": designation,
        "image": image,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
      };
}

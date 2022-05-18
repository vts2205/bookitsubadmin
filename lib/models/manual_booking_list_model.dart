// To parse this JSON data, do
//
//     final manualBookingListModel = manualBookingListModelFromJson(jsonString);

import 'dart:convert';

ManualBookingListModel manualBookingListModelFromJson(String str) => ManualBookingListModel.fromJson(json.decode(str));

String manualBookingListModelToJson(ManualBookingListModel data) => json.encode(data.toJson());

class ManualBookingListModel {
  ManualBookingListModel({
    this.success,
    this.userValue,
  });

  bool success;
  List<UserValue> userValue;

  factory ManualBookingListModel.fromJson(Map<String, dynamic> json) => ManualBookingListModel(
    success: json["success"],
    userValue: List<UserValue>.from(json["userValue"].map((x) => UserValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "userValue": List<dynamic>.from(userValue.map((x) => x.toJson())),
  };
}

class UserValue {
  UserValue({
    this.id,
    this.name,
    this.phonenumber,
    this.pickupLocation,
    this.pickupDate,
    this.dropLocation,
    this.dropDate,
    this.package,
    this.rentalhour,
    this.cab,
    this.subadminId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String phonenumber;
  String pickupLocation;
  DateTime pickupDate;
  dynamic dropLocation;
  DateTime dropDate;
  String package;
  dynamic rentalhour;
  String cab;
  int subadminId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserValue.fromJson(Map<String, dynamic> json) => UserValue(
    id: json["id"],
    name: json["name"],
    phonenumber: json["phonenumber"],
    pickupLocation: json["pickup_location"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    dropLocation: json["drop_location"],
    dropDate: DateTime.parse(json["drop_date"]),
    package: json["package"] == null ? null : json["package"],
    rentalhour: json["rentalhour"],
    cab: json["cab"] == null ? null : json["cab"],
    subadminId: json["subadmin_id"] == null ? null : json["subadmin_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phonenumber": phonenumber,
    "pickup_location": pickupLocation,
    "pickup_date": pickupDate.toIso8601String(),
    "drop_location": dropLocation,
    "drop_date": dropDate.toIso8601String(),
    "package": package == null ? null : package,
    "rentalhour": rentalhour,
    "cab": cab == null ? null : cab,
    "subadmin_id": subadminId == null ? null : subadminId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

// To parse this JSON data, do
//
//     final bookedRidesListModel = bookedRidesListModelFromJson(jsonString);

import 'dart:convert';

BookedRidesListModel bookedRidesListModelFromJson(String str) =>
    BookedRidesListModel.fromJson(json.decode(str));

String bookedRidesListModelToJson(BookedRidesListModel data) =>
    json.encode(data.toJson());

class BookedRidesListModel {
  BookedRidesListModel({
    this.success,
    this.userValue,
  });

  bool success;
  List<UserValue> userValue;

  factory BookedRidesListModel.fromJson(Map<String, dynamic> json) =>
      BookedRidesListModel(
        success: json["success"],
        userValue: List<UserValue>.from(
            json["userValue"].map((x) => UserValue.fromJson(x))),
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
    this.tripStatus,
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
  String tripStatus;
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
        package: json["package"],
        rentalhour: json["rentalhour"],
        cab: json["cab"],
        subadminId: json["subadmin_id"],
        tripStatus: json["trip_status"],
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
        "package": package,
        "rentalhour": rentalhour,
        "cab": cab,
        "subadmin_id": subadminId,
        "trip_status": tripStatus,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

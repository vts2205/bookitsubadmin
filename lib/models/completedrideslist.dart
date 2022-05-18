// To parse this JSON data, do
//
//     final completedRidesListModel = completedRidesListModelFromJson(jsonString);

import 'dart:convert';

CompletedRidesListModel completedRidesListModelFromJson(String str) =>
    CompletedRidesListModel.fromJson(json.decode(str));

String completedRidesListModelToJson(CompletedRidesListModel data) =>
    json.encode(data.toJson());

class CompletedRidesListModel {
  CompletedRidesListModel({
    this.success,
    this.userValue,
  });

  bool success;
  List<UserValue> userValue;

  factory CompletedRidesListModel.fromJson(Map<String, dynamic> json) =>
      CompletedRidesListModel(
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
    this.driverName,
    this.price,
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
  String driverName;
  String price;

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
        driverName: json["driver_name"],
        price: json["price"],
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
        "driver_name": driverName,
        "price": price,
      };
}

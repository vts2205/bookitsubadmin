// To parse this JSON data, do
//
//     final cancelledRidesListModel = cancelledRidesListModelFromJson(jsonString);

import 'dart:convert';

CancelledRidesListModel cancelledRidesListModelFromJson(String str) =>
    CancelledRidesListModel.fromJson(json.decode(str));

String cancelledRidesListModelToJson(CancelledRidesListModel data) =>
    json.encode(data.toJson());

class CancelledRidesListModel {
  CancelledRidesListModel({
    this.success,
    this.userValue,
  });

  bool success;
  List<UserValue> userValue;

  factory CancelledRidesListModel.fromJson(Map<String, dynamic> json) =>
      CancelledRidesListModel(
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
    this.cancelledBy,
    this.cancelledReason,
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
  String cancelledBy;
  String cancelledReason;

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
        driverName: json["driver_name"] == null ? null : json["driver_name"],
        cancelledBy: json["cancelled_by"] == null ? null : json["cancelled_by"],
        cancelledReason: json["cancelled_reason"],
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
        "driver_name": driverName == null ? null : driverName,
        "cancelled_by": cancelledBy == null ? null : cancelledBy,
        "cancelled_reason": cancelledReason,
      };
}

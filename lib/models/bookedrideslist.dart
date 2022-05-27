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
    this.tripStatus,
    this.cab,
    this.km,
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
  String tripStatus;
  String cab;
  int km;
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
        tripStatus: json["trip_status"],
        cab: json["cab"],
        km: json["km"] == null ? null : json["km"],
        price: json["price"] == null ? null : json["price"],
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
        "trip_status": tripStatus,
        "cab": cab,
        "km": km == null ? null : km,
        "price": price == null ? null : price,
      };
}

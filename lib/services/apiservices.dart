import 'dart:convert';

import 'package:bookitsubadminpanel/constants/apiconstants.dart';
import 'package:bookitsubadminpanel/models/bookedrideslist.dart';
import 'package:bookitsubadminpanel/models/cancelledrideslist.dart';
import 'package:bookitsubadminpanel/models/completedrideslist.dart';
import 'package:bookitsubadminpanel/models/getprofilemodel.dart';
import 'package:bookitsubadminpanel/models/manual_booking_list_model.dart';
import 'package:bookitsubadminpanel/models/progressrideslist.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  final box = GetStorage();

  Future createLogin(String email, password) async {
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.login;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.post(uri, body: {"email": email, "password": password});
    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future<GetProfileModel> fetchProfile() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.getProfile;
    var uri = Uri.parse(completeUrl);
    try {
      final response =
          await client.get(uri, headers: {'Authorization': ' $token'});
      print('token:$token');
      print(response.body);
      print('StatusCode: ${response.statusCode}');
      if (response.statusCode == 200) {
        print(response.body.toString());
        GetProfileModel getProfileModel =
            GetProfileModel.fromJson(json.decode(response.body));
        print(getProfileModel.toJson());
        return getProfileModel;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateProfile(
      String name, phonenumber, designation, email, password) async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.profileUpdate;
    var uri = Uri.parse(completeUrl);
    final response = await client.put(uri, headers: {
      'Authorization': '$token'
    }, body: {
      'name': email,
      'phonenumber': phonenumber,
      'designation': designation,
      'email': email,
      'password': password
    });
    print('$token');
    var convertedDataToJson = json.decode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }

  Future createManualBooking(String name, phonenumber, pickup_location) async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.manualBooking;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri, headers: {
      'Authorization': '$token'
    }, body: {
      'name': name,
      'phoneNumber': phonenumber,
      'pickupLocation': pickup_location,
    });
    var convertedDataFromJson = json.decode(response.body);
    print(convertedDataFromJson);
    return convertedDataFromJson;
  }

  Future<ManualBookingListModel> manualBookingList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.manualBookingList;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.get(uri, headers: {'Authorization': '$token'});
    print('token:$token');
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return manualBookingListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<BookedRidesListModel> bookedRidesList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.bookedRidesList;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.get(uri, headers: {'Authorization': '$token'});
    print('token:$token');
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return bookedRidesListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<ProgressRidesListModel> progressRidesList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.progressRidesList;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.get(uri, headers: {'Authorization': '$token'});
    print('token:$token');
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return progressRidesListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<CompletedRidesListModel> completedRidesList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.completedRidesList;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.get(uri, headers: {'Authorization': '$token'});
    print('token:$token');
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return completedRidesListModelFromJson(json);
    } else {
      return null;
    }
  }

  Future<CancelledRidesListModel> cancelledRidesList() async {
    var token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.completedRidesList;
    var uri = Uri.parse(completeUrl);
    final response =
        await client.get(uri, headers: {'Authorization': '$token'});
    print('token:$token');
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body.toString());
      var json = response.body;
      return cancelledRidesListModelFromJson(json);
    } else {
      return null;
    }
  }
}

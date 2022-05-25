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
import 'package:file_picker/file_picker.dart';

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

  Future driverRegister(
      String name,
      contact,
      ownerName,
      ownerNumber,
      location,
      licenseNumber,
      expiryDate,
      PlatformFile imageFile1,
      imageFile2,
      imageFile3,
      imageFile4,
      imageFile5,
      imageFile6,
      imageFile7,
      imageFile8,
      imageFile9,
      imageFile10,
      imageFile11,
      imageFile12,
      imageFile13,
      imageFile14,
      imageFile15,
      imageFile16,
      imageFile17) async {
    print('====API CALLED');
    var completeUrl =
        'http://3.110.225.148:9200/api/mobile/admin/subadminRegister';
    print(completeUrl);
    print('image $imageFile1');
    var request = http.MultipartRequest('POST', Uri.parse(completeUrl));
    request.fields["name"] = name;
    request.fields["contact"] = contact;
    request.fields["ownerName"] = ownerName;
    request.fields["ownerNumber"] = ownerNumber;
    request.fields["location"] = location;
    request.fields["licenseNumber"] = licenseNumber;
    request.fields["expiryDate"] = expiryDate;
    request.files.add(http.MultipartFile.fromBytes(
      'frontImage',
      imageFile1.bytes,
      filename: imageFile1.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'chaseNumber',
      imageFile2.bytes,
      filename: imageFile2.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'rcFront',
      imageFile3.bytes,
      filename: imageFile3.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'rcBack',
      imageFile4.bytes,
      filename: imageFile4.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'insurance',
      imageFile5.bytes,
      filename: imageFile5.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'profileImage',
      imageFile7.bytes,
      filename: imageFile7.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'aadharFront',
      imageFile8.bytes,
      filename: imageFile8.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'aadharBack',
      imageFile9.bytes,
      filename: imageFile9.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'licenseFront',
      imageFile10.bytes,
      filename: imageFile10.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'licenseBack',
      imageFile11.bytes,
      filename: imageFile11.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'owneraadharFront',
      imageFile12.bytes,
      filename: imageFile12.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'owneraadharBack',
      imageFile13.bytes,
      filename: imageFile13.name,
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'panCard',
      imageFile14.bytes,
      filename: imageFile14.name,
    ));
    if (imageFile6?.bytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'fc',
        imageFile6.bytes,
        filename: imageFile6.name,
      ));
    }
    if (imageFile15?.bytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'passbook',
        imageFile15.bytes,
        filename: imageFile15.name,
      ));
    }
    if (imageFile16?.bytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'rentalAgreement1',
        imageFile16.bytes,
        filename: imageFile16.name,
      ));
    }
    if (imageFile17?.bytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'rentalAgreement2',
        imageFile17.bytes,
        filename: imageFile17.name,
      ));
    }
    var res = await request.send();
    String result = await res.stream.bytesToString();
    print('result $result');
    print('res $res');
    var convertedDataToJson = jsonDecode(result);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  // var stream = http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));
  // int length = imageFile1.relativePath

  // var multipartFile = http.MultipartFile('files', stream, length,
  //     filename: basename('imageFile1'),
  //     contentType: MediaType('image', 'png'));
  // request.files.add(http.MultipartFile(
  //     "frontImage", imageFile1.readStream, imageFile1.size,
  //     filename: imageFile1.name));
  // http.MultipartFile multipartFile1 =
  //     await http.MultipartFile.fromBytes("frontImage", imageFile1 ?? '');
  // http.MultipartFile multipartFile2 = await http.MultipartFile.fromPath(
  //     "chaseNumber", imageFile2?.path ?? '');
  // http.MultipartFile multipartFile3 =
  //     await http.MultipartFile.fromPath("rcFront", imageFile3?.path ?? '');
  // http.MultipartFile multipartFile4 =
  //     await http.MultipartFile.fromPath("rcBack", imageFile4?.path ?? '');
  // http.MultipartFile multipartFile5 =
  //     await http.MultipartFile.fromPath("insurance", imageFile5?.path ?? '');
  // http.MultipartFile multipartFile7 = await http.MultipartFile.fromPath(
  //     "profileImage", imageFile7?.path ?? '');
  // http.MultipartFile multipartFile8 = await http.MultipartFile.fromPath(
  //     "aadharFront", imageFile8?.path ?? '');
  // http.MultipartFile multipartFile9 =
  //     await http.MultipartFile.fromPath("aadharBack", imageFile9?.path ?? '');
  // http.MultipartFile multipartFile10 = await http.MultipartFile.fromPath(
  //     "licenseFront", imageFile10?.path ?? '');
  // http.MultipartFile multipartFile11 = await http.MultipartFile.fromPath(
  //     "licenseBack", imageFile11?.path ?? '');
  // http.MultipartFile multipartFile12 = await http.MultipartFile.fromPath(
  //     "owneraadharFront", imageFile11?.path ?? '');
  // http.MultipartFile multipartFile13 = await http.MultipartFile.fromPath(
  //     "owneraadharBack", imageFile12?.path ?? '');
  // http.MultipartFile multipartFile14 =
  //     await http.MultipartFile.fromPath("panCard", imageFile12?.path ?? '');

  // if (imageFile6?.path != null &&

  //     imageFile15?.path != null &&
  //     imageFile16?.path != null &&
  //     imageFile17?.path != null) {
  //   if (imageFile6.path.isNotEmpty &&
  //       imageFile15.path.isNotEmpty &&
  //       imageFile16.path.isNotEmpty &&
  //       imageFile17.path.isNotEmpty) {
  //     http.MultipartFile multipartFile6 =
  //         await http.MultipartFile.fromPath("fc", imageFile6?.path ?? '');

  //     http.MultipartFile multipartFile15 = await http.MultipartFile.fromPath(
  //         "passbook", imageFile15?.path ?? '');
  //     request.files.add(multipartFile15);
  //     http.MultipartFile multipartFile16 = await http.MultipartFile.fromPath(
  //         "rentalAgreement1", imageFile16?.path ?? '');
  //     request.files.add(multipartFile16);
  //     http.MultipartFile multipartFile17 = await http.MultipartFile.fromPath(
  //         "rentalAgreement2", imageFile17?.path ?? '');
  //     request.files.add(multipartFile17);
  //   }
  // }
  // request.fields["fcmToken"] = await FirebaseMessaging.instance.getToken();

  //     http.MultipartFile multipartFile15 = await http.MultipartFile.fromPath(
  //         "frontImage", imageFile1?.path ?? '');
  // request.files.add(http.MultipartFile(
  //     'frontImage', imageFile1.readStream, imageFile1.size,
  //     filename: 'frontImage'));
  // request.files.add(http.MultipartFile(
  //     'chaseNumber', imageFile1.readStream, imageFile1.size,
  //     filename: 'chaseNumber'));
  // request.files.add(http.MultipartFile(
  //     'rcFront', imageFile1.readStream, imageFile1.size,
  //     filename: 'rcFront'));
  // request.files.add(http.MultipartFile(
  //     'rcBack', imageFile1.readStream, imageFile1.size,
  //     filename: 'rcBack'));
  // request.files.add(http.MultipartFile(
  //     'insurance', imageFile1.readStream, imageFile1.size,
  //     filename: 'insurance'));
  // request.files.add(http.MultipartFile(
  //     'fc', imageFile1.readStream, imageFile1.size,
  //     filename: 'fc'));
  // request.files.add(http.MultipartFile(
  //     'profileImage', imageFile1.readStream, imageFile1.size,
  //     filename: 'profileImage'));
  // request.files.add(http.MultipartFile(
  //     'aadharFront', imageFile1.readStream, imageFile1.size,
  //     filename: 'aadharFront'));
  // request.files.add(http.MultipartFile(
  //     'aadharBack', imageFile1.readStream, imageFile1.size,
  //     filename: 'aadharBack'));
  // request.files.add(http.MultipartFile(
  //     'licenseFront', imageFile1.readStream, imageFile1.size,
  //     filename: 'licenseFront'));
  // request.files.add(http.MultipartFile(
  //     'licenseBack', imageFile1.readStream, imageFile1.size,
  //     filename: 'licenseBack'));
  // request.files.add(http.MultipartFile(
  //     'owneraadharFront', imageFile1.readStream, imageFile1.size,
  //     filename: 'owneraadharFront'));
  // request.files.add(http.MultipartFile(
  //     'owneraadharBack', imageFile1.readStream, imageFile1.size,
  //     filename: 'owneraadharBack'));
  // request.files.add(http.MultipartFile(
  //     'panCard', imageFile1.readStream, imageFile1.size,
  //     filename: 'panCard'));
  // request.files.add(http.MultipartFile(
  //     'passbook', imageFile1.readStream, imageFile1.size,
  //     filename: 'passbook'));
  // request.files.add(http.MultipartFile(
  //     'rentalAgreement1', imageFile1.readStream, imageFile1.size,
  //     filename: 'rentalAgreement1'));
  // request.files.add(http.MultipartFile(
  //     'rentalAgreement2', imageFile1.readStream, imageFile1.size,
  //     filename: 'rentalAgreement2'));
  // request.files.add(multipartFile1);
  // request.files.add(multipartFile2);
  // request.files.add(multipartFile3);
  // request.files.add(multipartFile4);
  // request.files.add(multipartFile5);
  // request.files.add(multipartFile7);
  // request.files.add(multipartFile8);
  // request.files.add(multipartFile9);
  // request.files.add(multipartFile10);
  // request.files.add(multipartFile11);
  // request.files.add(multipartFile12);
  // request.files.add(multipartFile13);
  // request.files.add(multipartFile14);

}

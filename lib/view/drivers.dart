import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/services/apiservices.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class AddDriversPage extends StatefulWidget {
  const AddDriversPage({Key key}) : super(key: key);

  static const districtList = [
    "Ariyalur",
    "Chengalpattu",
    "Chennai",
    "Coimbatore",
    "Cuddalore",
    "Dharmapuri",
    "Dindigul",
    "Erode",
    "Kallakurichi",
    "Kanchipuram",
    "Kanyakumari",
    "Karur",
    "Krishnagiri",
    "Madurai",
    "Mayiladuthurai",
    "Nagapattinam",
    "Namakkal",
    "Nilgiris",
    "Perambalur",
    "Pondicherry",
    "Pudukkottai",
    "Ramanathapuram",
    "Ranipet",
    "Salem",
    "Sivagangai",
    "Tenkasi",
    "Thanjavur",
    "Theni",
    "Thoothukudi",
    "Tiruchirappalli",
    "Tirunelveli",
    "Tirupattur",
    "Tiruppur",
    "Tiruvallur",
    "Tiruvannamalai",
    "Tiruvarur",
    "Vellore",
    "Viluppuram",
    "Virudhunagar"
  ];

  @override
  State<AddDriversPage> createState() => _AddDriversPageState();
}

class _AddDriversPageState extends State<AddDriversPage> {
  PlatformFile imageFile;

  galleryImage() async {
    FilePickerResult result;

    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        withReadStream: false,
        allowedExtensions: ['jpg', 'pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
      );
    } catch (e) {
      print(e);
    }

    if (result != null) {
      try {
        String filename = result.files.single.name;
        imageFile = result.files.single;
        print('file.name.......');
        print(filename);
        print(imageFile);
      } catch (e) {
        print('e..........................');
        print(e);
      }
    }
    return imageFile;
  }

  TextEditingController name = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController ownerPhone = TextEditingController();
  TextEditingController driverPhone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController license = TextEditingController();
  TextEditingController date = TextEditingController();

  PlatformFile frontImage;
  PlatformFile chaseNumberImage;
  PlatformFile rcFront;
  PlatformFile rcBack;
  PlatformFile insurance;
  PlatformFile fcCopy;
  PlatformFile profilePhoto;
  PlatformFile aadhaarFront;
  PlatformFile aadhaarBack;
  PlatformFile licenseFront;
  PlatformFile licenseBack;
  PlatformFile owneraadharFront;
  PlatformFile owneraadharBack;
  PlatformFile panCard;
  PlatformFile passbook;
  PlatformFile rentalAgreement1;
  PlatformFile rentalAgreement2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  buildAddDriver(context)
                else
                  buildAddDriver(context)
              else
                buildSmallAddDriver(),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
            ],
          )),
        ],
      ),
    );
  }

  buildAddDriver(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: CustomText(
          text: "Add Driver",
          size: 20,
          weight: FontWeight.bold,
          color: green,
        ),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: name,
              cursorColor: green,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Enter driver name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: green)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: driverPhone,
              cursorColor: green,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Enter driver phone number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: green)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: ownerName,
              cursorColor: green,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Enter owner name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: green)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: ownerPhone,
              cursorColor: green,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Enter owner phone number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: green)),
              ),
            ),
          )
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                  cursorColor: green,
                  controller: location,
                  decoration: InputDecoration(
                    hintText: 'Enter your district',
                    contentPadding: const EdgeInsets.all(10),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green, width: 2)),
                  )),
              suggestionsCallback: (pattern) {
                return AddDriversPage.districtList.where((item) =>
                    item.toLowerCase().contains(pattern.toLowerCase()));
              },
              onSuggestionSelected: (String val) {
                location.text = val;
                print(val);
              },
              itemBuilder: (_, String item) {
                return ListTile(
                  title: Text(item),
                );
              },
              getImmediateSuggestions: true,
              hideSuggestionsOnKeyboardHide: false,
              hideOnEmpty: false,
              noItemsFoundBuilder: (context) => const Padding(
                padding: EdgeInsets.all(8),
                child: Text('No item found'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: license,
              cursorColor: green,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: 'Enter driver license number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: green)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
                controller: date,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green, width: 2)),
                    hintText: 'Enter your license expiry date'),
                readOnly: true,
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      date.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                }),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Front Image :',
                    size: 17,
                    color: green,
                  ),
                  // frontImage != null
                  //     ? Container(width: 50, height: 50, child: Image.memory())
                  //     : const Text('No File'),
                  TextButton(
                      onPressed: () async {
                        frontImage = await galleryImage();
                      },
                      child: Text('Upload',
                          style: TextStyle(
                              color: blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline))),
                  // TextButton(
                  //     onPressed: () async {
                  //       frontImage = await galleryImage();
                  //     },
                  //     child: Text(
                  //       'Upload',
                  //       style: TextStyle(
                  //           color: blue,
                  //           fontSize: 17,
                  //           decoration: TextDecoration.underline),
                  //     ))
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Chase Number Image :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        chaseNumberImage = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'RC Book Front :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        rcFront = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'RC Book Back :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        rcBack = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Insurance :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        insurance = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'FC Copy(optional) :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        fcCopy = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Profile Photo :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        profilePhoto = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'License Front :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        licenseFront = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'License Back :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        licenseBack = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Driver Aadhaar Front :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        aadhaarFront = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Driver Aadhaar Back :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        aadhaarBack = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Owner Pan :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        panCard = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Owner Aadhaar Front :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        owneraadharFront = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Owner Aadhaar Back :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        owneraadharBack = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Passbook(optional) :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        passbook = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Rental Agreement 1st page(optional) :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        rentalAgreement1 = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CustomText(
                    text: 'Rental Agreement 2nd page(optional) :',
                    size: 17,
                    color: green,
                  ),
                  TextButton(
                      onPressed: () async {
                        rentalAgreement2 = await galleryImage();
                      },
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blue),
              onPressed: () async {
                var data = await APIService().driverRegister(
                    name.text,
                    driverPhone.text,
                    ownerName.text,
                    ownerPhone.text,
                    location.text,
                    license.text,
                    date.text,
                    frontImage,
                    chaseNumberImage,
                    rcFront,
                    rcBack,
                    insurance,
                    fcCopy,
                    profilePhoto,
                    aadhaarFront,
                    aadhaarBack,
                    licenseFront,
                    licenseBack,
                    owneraadharFront,
                    owneraadharBack,
                    panCard,
                    passbook,
                    rentalAgreement1,
                    rentalAgreement2);
                print(data);
                if (data['message'] == 'Success') {
                  Fluttertoast.showToast(msg: data['message'], fontSize: 18);
                  print('====success====');
                } else if (data['message'] == 'Driver Already Exists') {
                  Fluttertoast.showToast(msg: data['message'], fontSize: 18);
                } else {
                  print('====failed====');
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: 50,
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )),
        ],
      )
    ]);
  }

  buildSmallAddDriver() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: "Add Driver",
            size: 20,
            weight: FontWeight.bold,
            color: green,
          ),
        ),
        TextField(
          controller: name,
          cursorColor: green,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Enter driver name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green)),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: driverPhone,
          cursorColor: green,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Enter driver phone number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green)),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ownerName,
          cursorColor: green,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Enter owner name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green)),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: ownerPhone,
          cursorColor: green,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Enter owner phone number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green)),
          ),
        ),
        const SizedBox(height: 10),
        TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
              cursorColor: green,
              controller: location,
              decoration: InputDecoration(
                hintText: 'Enter your district',
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2)),
              )),
          suggestionsCallback: (pattern) {
            return AddDriversPage.districtList.where(
                (item) => item.toLowerCase().contains(pattern.toLowerCase()));
          },
          onSuggestionSelected: (String val) {
            location.text = val;
            print(val);
          },
          itemBuilder: (_, String item) {
            return ListTile(
              title: Text(item),
            );
          },
          getImmediateSuggestions: true,
          hideSuggestionsOnKeyboardHide: false,
          hideOnEmpty: false,
          noItemsFoundBuilder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Text('No item found'),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: license,
          cursorColor: green,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Enter driver license number',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: green)),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
            controller: date,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2)),
                hintText: 'Enter your license expiry date'),
            readOnly: true,
            onTap: () async {
              DateTime pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  date.text =
                      formattedDate; //set output date to TextField value.
                });
              } else {
                print("Date is not selected");
              }
            }),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Front Image :',
                  size: 17,
                  color: green,
                ),
                // frontImage != null
                //     ?
                //     : const Text('No File'),
                TextButton(
                    onPressed: () async {
                      frontImage = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    )),
                // TextButton(
                //     onPressed: () async {
                //       frontImage = await galleryImage();
                //     },
                //     child: Text(
                //       'Upload',
                //       style: TextStyle(
                //           color: blue,
                //           fontSize: 17,
                //           decoration: TextDecoration.underline),
                //     ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Chase Number Image :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      chaseNumberImage = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'RC Book Front :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      rcFront = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'RC Book Back :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      rcBack = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Insurance :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      insurance = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'FC Copy(optional) :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      fcCopy = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Profile Photo :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      profilePhoto = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'License Front :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      licenseFront = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'License Back :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      licenseBack = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Driver Aadhaar Front :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      aadhaarFront = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Driver Aadhaar Back :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      aadhaarBack = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Owner Pan :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      panCard = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Owner Aadhaar Front :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      owneraadharFront = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Owner Aadhaar Back :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      owneraadharBack = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Passbook(optional) :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      passbook = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Rental Agreement 1st page(optional) :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      rentalAgreement1 = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(
                  text: 'Rental Agreement 2nd page(optional) :',
                  size: 17,
                  color: green,
                ),
                TextButton(
                    onPressed: () async {
                      rentalAgreement2 = await galleryImage();
                    },
                    child: Text(
                      'Upload',
                      style: TextStyle(
                          color: blue,
                          fontSize: 17,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: blue),
            onPressed: () async {
              var data = await APIService().driverRegister(
                  name.text,
                  driverPhone.text,
                  ownerName.text,
                  ownerPhone.text,
                  location.text,
                  license.text,
                  date.text,
                  frontImage,
                  chaseNumberImage,
                  rcFront,
                  rcBack,
                  insurance,
                  fcCopy,
                  profilePhoto,
                  aadhaarFront,
                  aadhaarBack,
                  licenseFront,
                  licenseBack,
                  owneraadharFront,
                  owneraadharBack,
                  panCard,
                  passbook,
                  rentalAgreement1,
                  rentalAgreement2);
              print(data);
              if (data['statusCode'] == 1) {
                print('====success====');
              } else {
                print('====failed====');
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.20,
              height: 50,
              child: const Center(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )),
      ],
    );
  }
}

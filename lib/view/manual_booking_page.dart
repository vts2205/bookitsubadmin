import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/models/manual_booking_list_model.dart';
import 'package:bookitsubadminpanel/services/apiservices.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:bookitsubadminpanel/widgets/drop_location_list.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManualBookingPage extends StatefulWidget {
  const ManualBookingPage({Key key}) : super(key: key);

  @override
  State<ManualBookingPage> createState() => _ManualBookingPageState();
}

class _ManualBookingPageState extends State<ManualBookingPage> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final pickup = TextEditingController();

  final box = GetStorage();

  ManualBookingListModel manualBookingListModel;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    manualBookingListModel = await APIService().manualBookingList();
    if (manualBookingListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);

  List rideitems = ['Local', 'Rental', 'Outstation', 'Tour Package'];
  String selectedRideItem;

  List packageitems = ['1 Hour', '2 Hours', '3 Hours', '4 Hours', '5 Hours'];
  String selectedPackageItem;

  List cabitems = ['Mini', 'Sedan', 'SUV'];
  String selectedCabItem;

  static List<String> dropLocationList = [null];

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
          const SizedBox(height: 50),
          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  buildAddBookingMedium()
                else
                  buildAddBookingLarge()
              else
                buildAddBookingSmall(),
              const SizedBox(height: 50),
              const Divider(thickness: 2),
              const SizedBox(height: 50),
              Text(
                'Booking List',
                style: TextStyle(
                    fontSize: 20, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              buildManualBookingTable()
            ],
          ))
        ],
      ),
    );
  }

  buildAddBookingLarge() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Booking',
          style:
              TextStyle(fontSize: 20, color: blue, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: name,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Name",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: phone,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Phone Number",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: pickup,
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Pickup Location",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
              children: [
                ..._getDropLocation(),
              ],
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                child: DropdownButton(
                  hint: Text(
                    selectedRideItem ?? 'Select Package',
                    style: const TextStyle(fontSize: 15),
                  ),
                  items: rideitems.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem,
                          style: const TextStyle(fontSize: 15),
                        ));
                  }).toList(),
                  onChanged: (newValue) => setState(() {
                    selectedRideItem = newValue;
                  }),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: DropdownButton(
                  hint: Text(
                    selectedPackageItem ?? 'Select Rental',
                    style: const TextStyle(fontSize: 15),
                  ),
                  items: packageitems.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem,
                          style: const TextStyle(fontSize: 15),
                        ));
                  }).toList(),
                  onChanged: (newValue) => setState(() {
                    selectedPackageItem = newValue;
                  }),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: DropdownButton(
                  hint: Text(
                    selectedCabItem ?? 'Select Cab',
                    style: const TextStyle(fontSize: 15),
                  ),
                  items: cabitems.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Text(
                          valueItem,
                          style: const TextStyle(fontSize: 15),
                        ));
                  }).toList(),
                  onChanged: (newValue) => setState(() {
                    selectedCabItem = newValue;
                  }),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text('Total Kms :',
                      style: TextStyle(fontSize: 15, color: blue)),
                  Text('100', style: TextStyle(fontSize: 15, color: green)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text('Total Fare :',
                      style: TextStyle(fontSize: 15, color: blue)),
                  Text('2000', style: TextStyle(fontSize: 15, color: green)),
                ],
              ),
            ),
            Row(
              children: [
                const Text('Pickup Date :', style: TextStyle(fontSize: 15)),
                TextButton(
                    onPressed: () {
                      pickDateTime();
                    },
                    child: Text(
                      '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                      style: TextStyle(fontSize: 15, color: blue),
                    )),
              ],
            ),
            Row(
              children: [
                const Text('Drop Date :', style: TextStyle(fontSize: 15)),
                TextButton(
                    onPressed: () {
                      pickDateTime();
                    },
                    child: Text(
                      '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                      style: TextStyle(fontSize: 15, color: blue),
                    )),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blue),
              onPressed: () async {
                var data = await APIService()
                    .createManualBooking(name.text, phone.text, pickup.text);
                if (data['success'] == true) {
                  box.write("token", data["token"]);
                  print('success');
                } else {
                  print('failed');
                  return null;
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: 45,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  buildAddBookingMedium() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Booking',
          style:
              TextStyle(fontSize: 20, color: blue, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Name",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Phone Number",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: green,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "Enter Pickup Location",
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green))),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
              children: [
                ..._getDropLocation(),
              ],
            ))
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Card(
            child: DropdownButton(
              hint: Text(
                selectedRideItem ?? 'Select Package',
                style: const TextStyle(fontSize: 15),
              ),
              items: rideitems.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: const TextStyle(fontSize: 15),
                    ));
              }).toList(),
              onChanged: (newValue) => setState(() {
                selectedRideItem = newValue;
              }),
            ),
          ),
          Card(
            child: DropdownButton(
              hint: Text(
                selectedPackageItem ?? 'Select Rental',
                style: const TextStyle(fontSize: 15),
              ),
              items: packageitems.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: const TextStyle(fontSize: 15),
                    ));
              }).toList(),
              onChanged: (newValue) => setState(() {
                selectedPackageItem = newValue;
              }),
            ),
          ),
          Card(
            child: DropdownButton(
              hint: Text(
                selectedCabItem ?? 'Select Cab',
                style: const TextStyle(fontSize: 15),
              ),
              items: cabitems.map((valueItem) {
                return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: const TextStyle(fontSize: 15),
                    ));
              }).toList(),
              onChanged: (newValue) => setState(() {
                selectedCabItem = newValue;
              }),
            ),
          ),
          Row(
            children: [
              Text('Total Kms :', style: TextStyle(fontSize: 15, color: blue)),
              Text('100', style: TextStyle(fontSize: 15, color: green)),
            ],
          ),
          Row(
            children: [
              Text('Total Fare :', style: TextStyle(fontSize: 15, color: blue)),
              Text('2000', style: TextStyle(fontSize: 15, color: green)),
            ],
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Text('Pickup Date :', style: TextStyle(fontSize: 15)),
                TextButton(
                    onPressed: () {
                      pickDateTime();
                    },
                    child: Text(
                      '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                      style: TextStyle(fontSize: 15, color: blue),
                    )),
              ],
            ),
            Row(
              children: [
                const Text('Drop Date :', style: TextStyle(fontSize: 15)),
                TextButton(
                    onPressed: () {
                      pickDateTime();
                    },
                    child: Text(
                      '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                      style: TextStyle(fontSize: 15, color: blue),
                    )),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: blue),
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 45,
                  padding: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )),
          ],
        )
      ],
    );
  }

  buildAddBookingSmall() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add Booking',
          style:
              TextStyle(fontSize: 20, color: blue, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextField(
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Name",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextField(
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Phone Number",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextField(
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Pickup Location",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        Column(
          children: [
            ..._getDropLocation(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: DropdownButton(
                hint: Text(
                  selectedRideItem ?? 'Select Package',
                  style: const TextStyle(fontSize: 15),
                ),
                items: rideitems.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: const TextStyle(fontSize: 15),
                      ));
                }).toList(),
                onChanged: (newValue) => setState(() {
                  selectedRideItem = newValue;
                }),
              ),
            ),
            Card(
              child: DropdownButton(
                hint: Text(
                  selectedPackageItem ?? 'Select Rental',
                  style: const TextStyle(fontSize: 15),
                ),
                items: packageitems.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: const TextStyle(fontSize: 15),
                      ));
                }).toList(),
                onChanged: (newValue) => setState(() {
                  selectedPackageItem = newValue;
                }),
              ),
            ),
            Card(
              child: DropdownButton(
                hint: Text(
                  selectedCabItem ?? 'Select Cab',
                  style: const TextStyle(fontSize: 15),
                ),
                items: cabitems.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: const TextStyle(fontSize: 15),
                      ));
                }).toList(),
                onChanged: (newValue) => setState(() {
                  selectedCabItem = newValue;
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text('Total Kms :',
                    style: TextStyle(fontSize: 15, color: blue)),
                Text('100', style: TextStyle(fontSize: 15, color: green)),
              ],
            ),
            Row(
              children: [
                Text('Total Fare :',
                    style: TextStyle(fontSize: 15, color: blue)),
                Text('2000', style: TextStyle(fontSize: 15, color: green)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Pickup Date :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                  style: TextStyle(fontSize: 15, color: blue),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Drop Date :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                  style: TextStyle(fontSize: 15, color: blue),
                )),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blue),
              onPressed: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.30,
                height: 45,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  Future pickDateTime() async {
    DateTime date = await pickDate();
    if (date == null) return;

    TimeOfDay time = await pickTime();
    if (time == null) return;

    final dateTime =
        DateTime(date.day, date.month, date.year, time.hour, time.minute);

    setState(() {
      this._dateTime = dateTime;
    });
  }

  Future<DateTime> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100));

  Future<TimeOfDay> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: _dateTime.hour, minute: _dateTime.minute),
      );

  buildManualBookingTable() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: active.withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 30),
        child: Visibility(
          visible: isLoading,
          child: isLoading == false
              ? Container()
              : DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: const [
                    DataColumn(
                      label: Text("Id"),
                    ),
                    DataColumn(
                      label: Text("Name"),
                    ),
                    DataColumn(label: Text("Phone Number")),
                    DataColumn(label: Text("Package")),
                    DataColumn(label: Text("Cab Type")),
                    DataColumn(
                      label: Text('Pickup Location'),
                    ),
                    DataColumn(label: Text("Drop Location")),
                    DataColumn(
                      label: Text('Pickup Date'),
                    ),
                    DataColumn(
                      label: Text('Drop Date'),
                    ),
                    // DataColumn(
                    //   label: Text('KM'),
                    // ),
                    // DataColumn(
                    //   label: Text('Price'),
                    // ),
                    DataColumn(
                      label: Text('Action'),
                    ),
                  ],
                  rows: manualBookingListModel.userValue
                      .map((e) => DataRow(cells: [
                            DataCell(CustomText(
                              text: (e.id.toString()),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.name),
                              size: 12,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.phonenumber),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.package.toString()),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.cab.toString()),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.pickupLocation),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.dropLocation.toString()),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.pickupDate.toString()),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            DataCell(CustomText(
                              text: (e.dropDate.toString()),
                              weight: FontWeight.normal,
                              size: 12,
                              color: Colors.black,
                            )),
                            // DataCell(CustomText(
                            //   text: (e.),
                            //   weight: FontWeight.normal,
                            //   size: 12,
                            //   color: Colors.black,
                            // )),
                            // DataCell(CustomText(
                            //   text: (e["price"]),
                            //   weight: FontWeight.normal,
                            //   size: 12,
                            //   color: Colors.black,
                            // )),
                            DataCell(Container(
                                decoration: BoxDecoration(
                                  color: light,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: active, width: .5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                child: CustomText(
                                  text: (e.status.toString()),
                                  color: active.withOpacity(.7),
                                  weight: FontWeight.bold,
                                  size: 12,
                                ))),
                          ]))
                      .toList()),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }

  List<Widget> _getDropLocation() {
    List<Widget> DropLocationTextFieldList = [];
    for (int i = 0; i < dropLocationList.length; i++) {
      DropLocationTextFieldList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: DropLocationTextField(i)),
            SizedBox(
              width: 16,
            ),
            _addRemoveButton(i == dropLocationList.length - 1, i),
          ],
        ),
      ));
    }
    return DropLocationTextFieldList;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          dropLocationList.insert(0, null);
        } else
          dropLocationList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

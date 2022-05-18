import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/models/bookedrideslist.dart';
import 'package:bookitsubadminpanel/services/apiservices.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:bookitsubadminpanel/widgets/shimmerwidget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RidesBookedPage extends StatefulWidget {
  RidesBookedPage({Key key}) : super(key: key);

  @override
  State<RidesBookedPage> createState() => _RidesBookedPageState();
}

class _RidesBookedPageState extends State<RidesBookedPage> {
  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);

  bool isVisible = false;

  final box = GetStorage();

  BookedRidesListModel bookedRidesListModel;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    bookedRidesListModel = await APIService().bookedRidesList();
    if (bookedRidesListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

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
          Align(
            alignment: Alignment.topLeft,
            child: buildFromToDate(),
          ),
          Expanded(
              child: ListView(
            children: [
              //buildDriverShimmer()
              if (isVisible) buildDriversTable()
            ],
          )),
        ],
      ),
    );
  }

  buildFromToDate() {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child:
                    Text('Today', style: TextStyle(fontSize: 15, color: blue))),
            Container(
              width: 1,
              height: 30,
              color: Colors.black,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Text('Yesterday',
                    style: TextStyle(fontSize: 15, color: blue))),
          ],
        ),
        Row(
          children: [
            const Text('From :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                  style: TextStyle(fontSize: 15, color: blue),
                )),
            Container(
              width: 1,
              height: 30,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            const Text('To :', style: TextStyle(fontSize: 15)),
            TextButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                  '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                  style: TextStyle(fontSize: 15, color: blue),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: blue),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        )
      ],
    );
  }

  Future pickDateTime() async {
    DateTime date = await pickDate();
    if (date == null) return;

    final dateTime = DateTime(date.day, date.month, date.year);

    setState(() {
      this._dateTime = dateTime;
    });
  }

  Future<DateTime> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100));

  buildDriversTable() {
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
        child: isLoading == false
            ? Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              )
            : DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: const [
                  DataColumn(label: Text("ID")),
                  DataColumn(
                    label: Text("Name"),
                  ),
                  DataColumn(
                    label: Text('Package'),
                  ),
                  DataColumn(
                    label: Text('Rental Hour'),
                  ),
                  DataColumn(
                    label: Text('Cab'),
                  ),
                  DataColumn(
                    label: Text('Pickup Location'),
                  ),
                  DataColumn(
                    label: Text('Drop Location'),
                  ),
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
                    label: Text('Status'),
                  ),
                ],
                rows: bookedRidesListModel.userValue
                    .map((e) => DataRow(cells: [
                          DataCell(CustomText(
                            text: (e.id.toString()),
                            size: 12,
                            weight: FontWeight.normal,
                            color: Colors.black,
                          )),
                          DataCell(CustomText(
                            text: (e.name),
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
                            text: (e.rentalhour.toString()),
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
                            text: (e.pickupDate.toIso8601String()),
                            weight: FontWeight.normal,
                            size: 12,
                            color: Colors.black,
                          )),
                          DataCell(CustomText(
                            text: (e.dropDate.toIso8601String()),
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
                          //   text: (e.price),
                          //   weight: FontWeight.normal,
                          //   size: 12,
                          //   color: Colors.black,
                          // )),
                          DataCell(CustomText(
                            text: (e.tripStatus),
                            weight: FontWeight.bold,
                            size: 15,
                            color: Colors.green,
                          )),
                        ]))
                    .toList()));
  }

  // buildDriverShimmer() {
  //   return Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         border: Border.all(color: active.withOpacity(.4), width: .5),
  //         boxShadow: [
  //           BoxShadow(
  //               offset: const Offset(0, 6),
  //               color: lightGrey.withOpacity(.1),
  //               blurRadius: 12)
  //         ],
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       padding: const EdgeInsets.all(16),
  //       margin: const EdgeInsets.only(bottom: 30),
  //       child: DataTable2(
  //           columnSpacing: 12,
  //           horizontalMargin: 12,
  //           minWidth: 600,
  //           columns: const [
  //             DataColumn(label: ShimmerWidget.rectangular(height: 16)),
  //             DataColumn(label: ShimmerWidget.rectangular(height: 16)),
  //             DataColumn(label: ShimmerWidget.rectangular(height: 16)),
  //             DataColumn(label: ShimmerWidget.rectangular(height: 16)),
  //             DataColumn(
  //               label: ShimmerWidget.rectangular(height: 16),
  //             ),
  //             DataColumn(
  //               label: ShimmerWidget.rectangular(height: 16),
  //             ),
  //             DataColumn(
  //               label: ShimmerWidget.rectangular(height: 16),
  //             ),
  //             DataColumn(
  //               label: ShimmerWidget.rectangular(height: 16),
  //             ),
  //           ],
  //           rows: driversinfo
  //               .map((e) => const DataRow(cells: [
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                     DataCell(ShimmerWidget.rectangular(height: 16)),
  //                   ]))
  //               .toList()));
  // }
}

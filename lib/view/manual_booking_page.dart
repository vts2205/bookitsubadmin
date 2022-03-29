import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManualBookingPage extends StatefulWidget {
  const ManualBookingPage({Key key}) : super(key: key);

  @override
  State<ManualBookingPage> createState() => _ManualBookingPageState();
}

class _ManualBookingPageState extends State<ManualBookingPage> {
  final List<Map<String, String>> manualBookingInfo = [
    {
      "name": "nivy",
      "phone": "6382136565",
      "pickup": "Gandhipuram",
      "pickupdate": "25.03.2022 11:45 AM",
      "drop": "Trichy",
      "dropdate": "25.03.2022 02:00 PM"
    }
  ];

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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: blue,
                ),
                child: IconButton(
                    onPressed: () {
                      openDialog();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              )),
          Expanded(
              child: ListView(
            children: [buildManualBookingTable()],
          ))
        ],
      ),
    );
  }

  Future<String> openDialog() => Get.defaultDialog<String>(
      barrierDismissible: false,
      title: "Manual Booking",
      titleStyle:
          TextStyle(color: blue, fontSize: 15, fontWeight: FontWeight.w900),
      radius: 5,
      content: Column(children: [
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
        const SizedBox(height: 10),
        TextField(
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Pickup Date",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextField(
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Drop Location",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 10),
        TextField(
          cursorColor: green,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: "Enter Drop Date",
              border: const OutlineInputBorder(),
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: green))),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: blue, padding: const EdgeInsets.all(15)),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Add",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ))
      ]));

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
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: const [
              DataColumn(
                label: Text("Name"),
              ),
              DataColumn(label: Text("Phone Number")),
              DataColumn(
                label: Text('Pickup Location'),
              ),
              DataColumn(
                label: Text('Pickup Date'),
              ),
              DataColumn(label: Text("Drop Location")),
              DataColumn(
                label: Text('Drop Date'),
              ),
            ],
            rows: manualBookingInfo
                .map((e) => DataRow(cells: [
                      DataCell(CustomText(
                        text: (e["name"]),
                        size: 12,
                        weight: FontWeight.normal,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["phone"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["pickup"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["pickupdate"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["drop"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                      DataCell(CustomText(
                        text: (e["dropdate"]),
                        weight: FontWeight.normal,
                        size: 12,
                        color: Colors.black,
                      )),
                    ]))
                .toList()));
  }
}

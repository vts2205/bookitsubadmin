// ignore_for_file: deprecated_member_use

import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/models/bookedrideslist.dart';
import 'package:bookitsubadminpanel/services/apiservices.dart';
import 'package:bookitsubadminpanel/utils/rides_booked_column.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RidesBookedPage extends StatefulWidget {
  const RidesBookedPage({Key key}) : super(key: key);

  @override
  State<RidesBookedPage> createState() => _RidesBookedPageState();
}

class _RidesBookedPageState extends State<RidesBookedPage> {
  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);

  bool isVisible = false;

  final box = GetStorage();

  BookedRidesListModel bookedRidesListModel;
  RidesBookedDataSource ridesBookedDataSource;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
    ridesBookedDataSource =
        RidesBookedDataSource(bookedRidesListModel: bookedRidesListModel);
  }

  getData() async {
    bookedRidesListModel = await APIService().bookedRidesList();
    if (bookedRidesListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
    bookedRidesListModel = bookedRidesListModel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            if (isVisible) buildRidesBookedTable()
          ],
        )),
      ],
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
      _dateTime = dateTime;
    });
  }

  Future<DateTime> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100));

  buildRidesBookedTable() {
    return SfDataGrid(
      source: ridesBookedDataSource,
      columns: buildGridColumns(),
    );
  }

  List<GridColumn> buildGridColumns() {
    return <GridColumn>[
      GridTextColumn(
          columnName: RidesBookedColumn.id.toString(),
          label: CustomText(
            text: 'ID',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.name.toString(),
          label: CustomText(
            text: 'Name',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.package.toString(),
          label: CustomText(
            text: 'Package',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.rentalHour.toString(),
          label: CustomText(
            text: 'Rental Hour',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.cab.toString(),
          label: CustomText(
            text: 'Cab',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.pickupLocation.toString(),
          label: CustomText(
            text: 'Pickup Location',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.dropLocation.toString(),
          label: CustomText(
            text: 'Drop Location',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.pickupDate.toString(),
          label: CustomText(
            text: 'Pickup Date',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.dropDate.toString(),
          label: CustomText(
            text: 'Drop Date',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.km.toString(),
          label: CustomText(
            text: 'KM',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.price.toString(),
          label: CustomText(
            text: 'Price',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          )),
      GridTextColumn(
          columnName: RidesBookedColumn.status.toString(),
          label: CustomText(
            text: 'Status',
            size: 20,
            color: blue,
            weight: FontWeight.bold,
          ))
    ];
  }
  // buildRidesBookedTable() {
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
  //       child: isLoading == false
  //           ? Center(
  //               child: CircularProgressIndicator(
  //                 color: green,
  //               ),
  //             )
  //           : DataTable2(
  //               columnSpacing: 12,
  //               horizontalMargin: 12,
  //               minWidth: 600,
  //               columns: const [
  //                 DataColumn(label: Text("ID")),
  //                 DataColumn(
  //                   label: Text("Name"),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Package'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Rental Hour'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Cab'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Pickup Location'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Drop Location'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Pickup Date'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Drop Date'),
  //                 ),
  //                 // DataColumn(
  //                 //   label: Text('KM'),
  //                 // ),
  //                 // DataColumn(
  //                 //   label: Text('Price'),
  //                 // ),
  //                 DataColumn(
  //                   label: Text('Status'),
  //                 ),
  //               ],
  //               rows: bookedRidesListModel.userValue
  //                   .map((e) => DataRow(cells: [
  //                         DataCell(CustomText(
  //                           text: (e.id.toString()),
  //                           size: 12,
  //                           weight: FontWeight.normal,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.name),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.package.toString()),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.rentalhour.toString()),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.cab.toString()),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.pickupLocation),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.dropLocation.toString()),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.pickupDate.toIso8601String()),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         DataCell(CustomText(
  //                           text: (e.dropDate.toIso8601String()),
  //                           weight: FontWeight.normal,
  //                           size: 12,
  //                           color: Colors.black,
  //                         )),
  //                         // DataCell(CustomText(
  //                         //   text: (e.),
  //                         //   weight: FontWeight.normal,
  //                         //   size: 12,
  //                         //   color: Colors.black,
  //                         // )),
  //                         // DataCell(CustomText(
  //                         //   text: (e.price),
  //                         //   weight: FontWeight.normal,
  //                         //   size: 12,
  //                         //   color: Colors.black,
  //                         // )),
  //                         DataCell(CustomText(
  //                           text: (e.tripStatus),
  //                           weight: FontWeight.bold,
  //                           size: 15,
  //                           color: Colors.green,
  //                         )),
  //                       ]))
  //                   .toList()));
  // }

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

class RidesBookedDataSource extends DataGridSource {
  List<DataGridRow> _bookedRidesListModel;

  @override
  List<DataGridRow> get rows => _bookedRidesListModel;
  RidesBookedDataSource({BookedRidesListModel bookedRidesListModel}) {
    buildDataGrid(bookedRidesListModel);
  }

  void buildDataGrid(BookedRidesListModel bookedRidesListModel) =>
      _bookedRidesListModel = bookedRidesListModel.userValue
          .map<DataGridRow>((e) => DataGridRow(cells: [
                DataGridCell(columnName: 'id', value: e.id),
                DataGridCell(columnName: 'name', value: e.name),
                DataGridCell(
                    columnName: 'package', value: e.package.toString()),
                DataGridCell(
                    columnName: 'rentalHour', value: e.rentalhour.toString()),
                DataGridCell(columnName: 'cab', value: e.cab.toString()),
                DataGridCell(
                    columnName: 'pickupLocation', value: e.pickupLocation),
                DataGridCell(
                    columnName: 'dropLocation',
                    value: e.dropLocation.toString()),
                DataGridCell(
                    columnName: 'pickupDate',
                    value: e.pickupDate.toIso8601String()),
                DataGridCell(
                    columnName: 'dropDate',
                    value: e.dropDate.toIso8601String()),
                DataGridCell(columnName: 'km', value: e.km.toString()),
                DataGridCell(columnName: 'id', value: e.price.toString()),
                DataGridCell(columnName: 'status', value: e.tripStatus),
              ]))
          .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

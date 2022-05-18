import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/models/completedrideslist.dart';
import 'package:bookitsubadminpanel/services/apiservices.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:bookitsubadminpanel/widgets/shimmerwidget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RidesCompletedPage extends StatefulWidget {
  RidesCompletedPage({Key key}) : super(key: key);

  @override
  State<RidesCompletedPage> createState() => _RidesCompletedPageState();
}

class _RidesCompletedPageState extends State<RidesCompletedPage> {
  CompletedRidesListModel completedRidesListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    completedRidesListModel = await APIService().completedRidesList();
    if (completedRidesListModel != null) {
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
          Expanded(
              child: ListView(
            children: [
              //buildDriverShimmer()
              buildDriversTable()
            ],
          )),
        ],
      ),
    );
  }

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
                    label: Text("User Name"),
                  ),
                  DataColumn(label: Text("Driver Name")),
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
                  DataColumn(
                    label: Text('Payment'),
                  ),
                ],
                rows: completedRidesListModel.userValue
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
                            text: (e.driverName),
                            weight: FontWeight.normal,
                            size: 12,
                            color: Colors.black,
                          )),
                          DataCell(CustomText(
                            text: (e.package),
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
                            text: (e.cab),
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
                          DataCell(CustomText(
                            text: (e.price),
                            weight: FontWeight.normal,
                            size: 12,
                            color: Colors.black,
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

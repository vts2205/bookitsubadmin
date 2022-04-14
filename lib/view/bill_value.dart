import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillValuePage extends StatelessWidget {
  const BillValuePage({Key key}) : super(key: key);

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
          // const SizedBox(height: 50),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: buildSearchBar(),
          // ),
          // Expanded(
          //     child: ListView(
          //       children: [
          //         //buildDriverShimmer()
          //         buildDriversTable()
          //       ],
          //     )),
        ],
      ),
    );
  }
}

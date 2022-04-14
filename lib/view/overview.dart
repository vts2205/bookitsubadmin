import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:bookitsubadminpanel/widgets/driverbarchart.dart';
import 'package:bookitsubadminpanel/widgets/info_card.dart';
import 'package:bookitsubadminpanel/widgets/info_card_small.dart';
import 'package:bookitsubadminpanel/widgets/userinfo.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewPage extends StatelessWidget {
  OverviewPage({Key key}) : super(key: key);

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
                  buildOverviewCardsMediumScreen(context)
                else
                  buildOverviewCardsLargeScreen(context)
              else
                buildOverviewCardsSmallScreen(context),
              if (!ResponsiveWidget.isSmallScreen(context))
                buildDriverSectionLarge(context)
              else
                buildDriverSectionSmall(context),
            ],
          ))
        ],
      ),
    );
  }

  Widget buildOverviewCardsLargeScreen(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        InfoCard(
          title: "Rides Booked",
          value: "7",
          onTap: () {},
          topColor: active,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Rides in Progress",
          value: "32",
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Rides Completed",
          value: "17",
          topColor: Colors.lightGreen,
          onTap: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Rides Cancelled",
          value: "3",
          topColor: Colors.redAccent,
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildOverviewCardsMediumScreen(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Rides Booked",
              value: "32",
              onTap: () {},
              topColor: active,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Rides in progress",
              value: "7",
              onTap: () {},
              topColor: Colors.orange,
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
            InfoCard(
              title: "Rides Completed",
              value: "17",
              topColor: Colors.lightGreen,
              onTap: () {},
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Rides Cancelled",
              value: "3",
              topColor: Colors.redAccent,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget buildOverviewCardsSmallScreen(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCardSmall(
            title: "Rides Booked",
            value: "32",
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Rides in progress",
            value: "7",
            onTap: () {},
            isActive: true,
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Rides Completed",
            value: "17",
            onTap: () {},
          ),
          SizedBox(
            height: _width / 64,
          ),
          InfoCardSmall(
            title: "Rides Cancelled",
            value: "3",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildDriverSectionLarge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Driver Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: DriverBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 120,
            color: lightGrey,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    UserInfo(
                      title: "Today\'s drivers",
                      count: "2",
                    ),
                    UserInfo(
                      title: "Last 7 days",
                      count: "10",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    UserInfo(
                      title: "Last 30 days",
                      count: "50",
                    ),
                    UserInfo(
                      title: "Last 12 months",
                      count: "1300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDriverSectionSmall(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Driver Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                Container(
                    width: 600,
                    height: 200,
                    child: DriverBarChart.withSampleData()),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 1,
            color: lightGrey,
          ),
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    UserInfo(
                      title: "Today\'s drivers",
                      count: "2",
                    ),
                    UserInfo(
                      title: "Last 7 days",
                      count: "10",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    UserInfo(
                      title: "Last 30 days",
                      count: "50",
                    ),
                    UserInfo(
                      title: "Last 12 months",
                      count: "1300",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

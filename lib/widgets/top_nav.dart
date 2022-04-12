import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset("assets/icons/logo.png", width: 30),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState?.openDrawer();
              }),
      title: Container(
        child: Row(
          children: [
            Visibility(
                visible: !ResponsiveWidget.isSmallScreen(context),
                child: Image.asset(
                  "assets/images/bookit.png",
                  width: 80,
                )),
            Expanded(child: Container()),
            Container(
              width: 1,
              height: 22,
              color: lightGrey,
            ),
            const SizedBox(
              width: 24,
            ),
            CustomText(
              text: "Sub-Admin",
              color: blue,
              size: 20,
              weight: FontWeight.normal,
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  color: active.withOpacity(.5),
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(2),
                child: CircleAvatar(
                  backgroundColor: light,
                  child: Icon(
                    Icons.person_outline,
                    color: dark,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

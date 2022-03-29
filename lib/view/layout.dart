import 'package:bookitsubadminpanel/helpers/local_navigator.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/widgets/custom_screen.dart';
import 'package:bookitsubadminpanel/widgets/large_screen.dart';
import 'package:bookitsubadminpanel/widgets/medium_screen.dart';
import 'package:bookitsubadminpanel/widgets/side_menu.dart';
import 'package:bookitsubadminpanel/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ResponsiveWidget(
          largeScreen: const LargeScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          ),
          mediumScreen: const MediumScreen(),
          customScreen: const CustomScreen(),
        ),
      ),
    );
  }
}

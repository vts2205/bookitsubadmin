import 'package:bookitsubadminpanel/routing/routes.dart';
import 'package:bookitsubadminpanel/view/manual_booking_page.dart';
import 'package:bookitsubadminpanel/view/overview.dart';
import 'package:bookitsubadminpanel/view/profile.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverviewPageRoute:
      return _getPageRoute(OverviewPage());
    case ProfilePageRoute:
      return _getPageRoute(const ProfilePage());
    case ManualBookingRoute:
      return _getPageRoute(ManualBookingPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

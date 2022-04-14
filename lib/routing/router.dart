import 'package:bookitsubadminpanel/routing/routes.dart';
import 'package:bookitsubadminpanel/view/manual_booking_page.dart';
import 'package:bookitsubadminpanel/view/overview.dart';
import 'package:bookitsubadminpanel/view/profile.dart';
import 'package:bookitsubadminpanel/view/rides_booked.dart';
import 'package:bookitsubadminpanel/view/rides_cancelled.dart';
import 'package:bookitsubadminpanel/view/rides_completed.dart';
import 'package:bookitsubadminpanel/view/rides_progress.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverviewPageRoute:
      return _getPageRoute(OverviewPage());
    case ProfilePageRoute:
      return _getPageRoute(const ProfilePage());
    case ManualBookingRoute:
      return _getPageRoute(const ManualBookingPage());
    case RidesBookedRoute:
      return _getPageRoute(RidesBookedPage());
    case RidesInProgressRoute:
      return _getPageRoute(RidesInProgressPage());
    case RidesCompletedRoute:
      return _getPageRoute(RidesCompletedPage());
    case RidesCancelledRoute:
      return _getPageRoute(RidesCancelledPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

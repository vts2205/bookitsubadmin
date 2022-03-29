import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/routing/router.dart';
import 'package:bookitsubadminpanel/routing/routes.dart';
import 'package:flutter/cupertino.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: OverviewPageRoute,
    );

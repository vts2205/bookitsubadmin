
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OverviewPageRoute.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case ProfilePageRoute:
        return _customIcon(Icons.account_circle_outlined, itemName);
      case ManualBookingRoute:
        return _customIcon(Icons.directions_car_rounded, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: blue);

    return Icon(
      icon,
      color: isHovering(itemName) ? green : dark.withOpacity(0.8),
    );
  }
}

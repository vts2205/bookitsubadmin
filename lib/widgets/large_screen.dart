import 'package:bookitsubadminpanel/helpers/local_navigator.dart';
import 'package:bookitsubadminpanel/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: SideMenu()),
        Expanded(
          flex: 5,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: localNavigator()),
        )
      ],
    );
  }
}

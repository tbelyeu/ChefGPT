import 'package:chefgpt/helpers/responsiveness.dart';
import 'package:chefgpt/widgets/side_menu/horizontal_menu_item.dart';
import 'package:chefgpt/widgets/side_menu/vertical_menu_item.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final void Function() onTap;
  const SideMenuItem({super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isMediumScreen(context) ||
        ResponsiveWidget.isCustomScreen(context)) {
      return VerticalMenuItem(itemName: itemName, onTap: onTap);
    } else {
      return HorizontalMenuItem(itemName: itemName, onTap: onTap);
    }
  }
}

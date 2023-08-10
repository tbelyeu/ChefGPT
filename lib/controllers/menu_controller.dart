import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  static SideMenuController instance = Get.find();

  var activeItem = NewRecipePageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case NewRecipePageRoute:
        return _customIcon(Icons.add, itemName);
      case MyRecipesPageRoute:
        return _customIcon(Icons.star, itemName);
      case SignInPageRoute:
        return _customIcon(Icons.login, itemName);
      default:
        return _customIcon(Icons.logout, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 26,
        color: dark,
      );
    } else {
      return Icon(
        icon,
        color: isHovering(itemName) ? dark : lightGrey,
      );
    }
  }
}

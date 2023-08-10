import 'package:chefgpt/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  goBack() => navigationKey.currentState!.pop();

  RxBool showSignIn = true.obs;
  RxBool showSignUp = false.obs;
  RxBool showSignOut = false.obs;

  toggleSignInSignUp() {
    if (showSignIn.value) {
      sideMenuItems.removeAt(2);
      sideMenuItems.add(SignInPageRoute);
    } else if (showSignUp.value) {
      sideMenuItems.removeAt(2);
      sideMenuItems.add(SignUpPageRoute);
    } else if (showSignOut.value) {
      sideMenuItems.removeAt(2);
      sideMenuItems.add(SignOutPageRoute);
    }
  }
}

import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/helpers/responsiveness.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:chefgpt/widgets/side_menu/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("icons/hat2.png"),
                    ),
                    const Flexible(
                      child: CustomText(
                        text: "ChefGPT",
                        size: 20,
                        weight: FontWeight.bold,
                        color: dark,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 20),
          // Divider(color: lightGrey.withOpacity(.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                      // Will be doing something like this to make the label sign in vs sign out
                      // itemName: itemName == AuthenticationPageRoute
                      //     ? "Sign In"
                      //     : itemName,
                      itemName: itemName,
                      onTap: () {
                        if (itemName == SignOutPageRoute) {
                          // TODO:: firebase log out
                        }

                        if (!menuController.isActive(itemName)) {
                          menuController.changeActiveItemTo(itemName);
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();
                          }

                          navigationController.navigateTo(itemName);
                        }
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

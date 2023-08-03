import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/helpers/responsiveness.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:chefgpt/widgets/navbar_user.dart';
import 'package:flutter/material.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "icons/hat2.png",
                    width: 32,
                  ),
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      elevation: 0,
      backgroundColor: pastelGreen,
      title: Row(children: [
        const Visibility(
          child: CustomText(
            text: "ChefGPT",
            color: dark,
            size: 25,
            weight: FontWeight.w600,
          ),
        ),
        Expanded(child: Container()),
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: dark,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: dark,
          ),
          onPressed: () {},
        ),
        const NavBarUser(),
      ]),
      iconTheme: const IconThemeData(color: dark),
    );

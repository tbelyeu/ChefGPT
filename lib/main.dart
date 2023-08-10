import 'package:chefgpt/controllers/ingredient_controller.dart';
import 'package:chefgpt/controllers/navigation_controller.dart';
import 'package:chefgpt/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/layout.dart';
import 'package:chefgpt/controllers/menu_controller.dart';

void main() {
  Get.put(SideMenuController());
  Get.put(NavigationController());
  Get.put(NewRecipeController());
  Get.put(SettingsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ChefGPT",
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.epilogueTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: dark),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
      home: SiteLayout(),
    );
  }
}

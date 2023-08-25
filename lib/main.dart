import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/controllers/authentication_controller.dart';
import 'package:chefgpt/controllers/my_recipes_controller.dart';
import 'package:chefgpt/controllers/new_recipe_controller.dart';
import 'package:chefgpt/controllers/navigation_controller.dart';
import 'package:chefgpt/controllers/settings_controller.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/layout.dart';
import 'package:chefgpt/controllers/menu_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: "dotenv");
  OpenAI.apiKey = dotenv.get("OPEN_AI_API_KEY");

  Get.put(SideMenuController());
  Get.put(NavigationController());
  Get.put(NewRecipeController());
  Get.put(MyRecipesController());
  Get.put(SettingsController());
  Get.put(AuthenticationController());
  authenticationController.initUser();

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

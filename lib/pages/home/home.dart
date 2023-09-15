import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 200),
          const CustomText(
            text: "Home Page Under Construction",
            size: 30,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              menuController.changeActiveItemTo(NewRecipePageRoute);
              navigationController.navigateTo(NewRecipePageRoute);
            },
            child: const CustomText(
              text: "To New Recipe Page",
              color: accentPurple,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

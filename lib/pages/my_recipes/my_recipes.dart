import 'package:chefgpt/helpers/responsiveness.dart';
import 'package:chefgpt/pages/my_recipes/widgets/my_recipes_large.dart';
import 'package:chefgpt/pages/my_recipes/widgets/my_recipes_small.dart';
import 'package:flutter/material.dart';

class MyRecipesPage extends StatelessWidget {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context) ||
        ResponsiveWidget.isMediumScreen(context)) {
      return const MyRecipesLarge();
    } else {
      return const MyRecipesSmall();
    }
  }
}

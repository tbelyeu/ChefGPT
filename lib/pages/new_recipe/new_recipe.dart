import 'package:chefgpt/helpers/responsiveness.dart';
import 'package:chefgpt/pages/new_recipe/widgets/new_recipe_large.dart';
import 'package:chefgpt/pages/new_recipe/widgets/new_recipe_small.dart';
import 'package:flutter/material.dart';

class NewRecipePage extends StatelessWidget {
  const NewRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context) ||
        ResponsiveWidget.isMediumScreen(context)) {
      return const NewRecipeLarge();
    } else {
      return const NewRecipeSmall();
    }
  }
}

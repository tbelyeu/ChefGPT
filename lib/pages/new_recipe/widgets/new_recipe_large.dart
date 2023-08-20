import 'package:chefgpt/pages/new_recipe/widgets/add_ingredients_panel.dart';
import 'package:chefgpt/pages/new_recipe/widgets/generated_recipes_panel.dart';
import 'package:flutter/material.dart';

class NewRecipeLarge extends StatelessWidget {
  const NewRecipeLarge({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * (5 / 6);

    return Row(
      children: [
        Expanded(
          child: Container(color: Colors.transparent),
        ),
        SizedBox(
          width: width / 2.25,
          child: const AddIngredientsPanel(),
        ),
        Container(
          width: 40,
          color: Colors.transparent,
        ),
        SizedBox(
          width: width / 2,
          child: const GeneratedRecipesPanel(),
        ),
        Expanded(
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}

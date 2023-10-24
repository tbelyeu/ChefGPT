import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/pages/new_recipe/widgets/new_recipe_card.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneratedRecipesPanel extends StatelessWidget {
  const GeneratedRecipesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Obx(
          () => CustomText(
            text: newRecipeController.recipeTitlesList.isNotEmpty
                ? "Recipes"
                : "",
            size: 30,
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 18)),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: newRecipeController.recipeTitlesList.length,
              itemBuilder: (context, index) {
                final title = newRecipeController.recipeTitlesList[index];
                final ingredients =
                    newRecipeController.recipeIngredientsList[index];
                final instructions =
                    newRecipeController.recipeInstructionsList[index];

                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: NewRecipeCard(
                    title: title,
                    ingredients: ingredients,
                    instructions: instructions,
                    index: index,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

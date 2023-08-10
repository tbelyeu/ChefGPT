import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/pages/my_recipes/widgets/saved_recipe_card.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRecipesPage extends StatelessWidget {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CustomText(
                text: "Saved Recipes",
                size: 30,
              ),
              const Padding(padding: EdgeInsets.only(top: 18)),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: newRecipeController.recipesList.length,
                    itemBuilder: (context, index) {
                      final title = newRecipeController.recipesList[index];
                      final ingredients =
                          newRecipeController.recipeIngredientsList[index];
                      final instructions =
                          newRecipeController.recipeInstructionsList[index];

                      if (newRecipeController.recipeStarred.isEmpty) {
                        for (var recipe in newRecipeController.recipesList) {
                          newRecipeController.recipeStarred.add(false);
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Dismissible(
                          key: Key(title),
                          onDismissed: (direction) {
                            // newRecipeController.removeIngredientAtIndex(index);

                            // TODO:: snackbar style, undo functionality
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('$title removed')));
                          },
                          confirmDismiss: (direction) async {
                            //TODO:: implement a confirmation popup
                            return true;
                          },
                          child: SavedRecipeCard(
                            title: title,
                            ingredients: ingredients,
                            instructions: instructions,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }
}

import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/pages/my_recipes/widgets/saved_recipe_card.dart';
import 'package:chefgpt/services/auth.dart';
import 'package:chefgpt/services/recipe.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRecipesPage extends StatelessWidget {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    myRecipesController.updateSavedRecipes();

    return Row(
      children: [
        const SizedBox(width: 30),
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
                  () => myRecipesController.savedRecipes.isNotEmpty
                      ? ListView.builder(
                          itemCount: myRecipesController.savedRecipes.length,
                          itemBuilder: (context, index) {
                            final title =
                                myRecipesController.savedRecipes[index].title;
                            final ingredients = myRecipesController
                                .savedRecipes[index].ingredients;
                            final instructions = myRecipesController
                                .savedRecipes[index].instructions;

                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Dismissible(
                                key: Key(title),
                                onDismissed: (direction) {
                                  if (Auth().userSignedIn()) {
                                    RecipeService().deleteRecipe(
                                      userId: Auth().currentUser!.uid,
                                      title: title,
                                      ingredients: ingredients,
                                      instructions: instructions,
                                    );
                                  }
                                  myRecipesController
                                      .removeRecipeAtIndex(index);

                                  // TODO:: snackbar style, undo functionality
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('$title removed')));
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
                        )
                      : const Center(
                          child: Column(
                            children: [
                              SizedBox(height: 200),
                              CustomText(
                                text: "None yet.",
                                size: 20,
                                color: darkGrey,
                              ),
                              CustomText(
                                text: "Starred recipes show up here.",
                                size: 20,
                                color: darkGrey,
                              ),
                            ],
                          ),
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

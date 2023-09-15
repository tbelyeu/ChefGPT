import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/helpers/responsiveness.dart';
import 'package:chefgpt/pages/my_recipes/widgets/saved_recipe_card.dart';
import 'package:chefgpt/services/auth.dart';
import 'package:chefgpt/services/recipe.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';

class MyRecipesSmall extends StatelessWidget {
  const MyRecipesSmall({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (!ResponsiveWidget.isSmallScreen(context)) {
      width = width * (5 / 6);
    }
    myRecipesController.updateSavedRecipes();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverStickyHeader(
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: width,
                  color: light,
                ),
                Container(
                  color: light,
                  width: width,
                  height: 40,
                  child: const CustomText(
                    text: "Saved Recipes",
                    size: 30,
                  ),
                ),
                Container(
                  height: 10,
                  width: width,
                  color: Colors.transparent,
                ),
              ],
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Obx(
                    () => myRecipesController.savedRecipes.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              myRecipesController.savedRecipes.length,
                              (index) {
                                final title = myRecipesController
                                    .savedRecipes[index].title;
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
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
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
                            ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

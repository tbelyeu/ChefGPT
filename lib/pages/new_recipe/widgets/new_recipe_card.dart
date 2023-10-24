import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/models/recipe.dart';
import 'package:chefgpt/services/auth.dart';
import 'package:chefgpt/services/recipe.dart';
import 'package:chefgpt/widgets/ordered_list.dart';
import 'package:chefgpt/widgets/unordered_list.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRecipeCard extends StatelessWidget {
  final String title;
  final List<String> ingredients;
  final List<String> instructions;
  final int index;
  const NewRecipeCard(
      {super.key,
      required this.title,
      required this.ingredients,
      required this.instructions,
      required this.index});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {});
    ExpandableController expandableController =
        ExpandableController(initialExpanded: true);

    return Card(
      elevation: 2,
      color: light,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExpandablePanel(
          controller: expandableController,
          header: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Obx(
                () => IconButton(
                  icon: newRecipeController.recipeStarred[index]
                      ? Icon(
                          Icons.star,
                          color: Colors.amber.shade300,
                        )
                      : const Icon(
                          Icons.star_border,
                          color: dark,
                        ),
                  iconSize: 32,
                  color: dark,
                  hoverColor: Colors.transparent,
                  splashRadius: 0.01,
                  onPressed: () {
                    newRecipeController.toggleRecipeStarred(index);

                    if (Auth().userSignedIn()) {
                      if (newRecipeController.recipeStarred[index]) {
                        RecipeService().createRecipe(
                          userId: Auth().currentUser!.uid,
                          title: title,
                          ingredients: ingredients,
                          instructions: instructions,
                        );
                      } else {
                        RecipeService().deleteRecipe(
                          userId: Auth().currentUser!.uid,
                          title: title,
                          ingredients: ingredients,
                          instructions: instructions,
                        );
                      }
                    } else {
                      if (newRecipeController.recipeStarred[index]) {
                        RecipeModel recipe = RecipeModel(
                          title: title,
                          ingredients: ingredients,
                          instructions: instructions,
                        );
                        myRecipesController.addSavedRecipe(recipe);
                      } else {
                        myRecipesController.removeRecipeAtIndex(index);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const CustomText(
                text: "Ingredients",
                size: 20,
                color: darkGrey,
              ),
              UnorderedList(ingredients),
              const CustomText(
                text: "Instructions",
                size: 20,
                color: darkGrey,
              ),
              OrderedList(instructions),
            ],
          ),
          collapsed: Container(),
          theme: const ExpandableThemeData(
            iconColor: dark,
            iconSize: 32,
            useInkWell: false,
            tapHeaderToExpand: true,
          ),
        ),
      ),
    );
  }
}

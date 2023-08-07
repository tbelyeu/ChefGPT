import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/pages/new_recipe/widgets/ingredient_card.dart';
import 'package:chefgpt/pages/new_recipe/widgets/new_recipe_card.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRecipePage extends StatelessWidget {
  const NewRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    FocusNode focusNode = FocusNode();
    double width = MediaQuery.of(context).size.width * (5 / 6);

    print(newRecipeController.recipeStarred);

    return Row(
      children: [
        Expanded(
          child: Container(color: Colors.transparent),
        ),
        SizedBox(
          width: width / 2.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CustomText(
                text: "Add Ingredients",
                size: 30,
              ),
              const Padding(padding: EdgeInsets.only(top: 18)),
              SizedBox(
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    label: const CustomText(
                      text: "New Ingredient",
                      size: 18,
                      color: lightGrey,
                    ),
                  ),
                  focusNode: focusNode,
                  onSubmitted: (value) {
                    if (value != "") {
                      newRecipeController.addIngredient(value);
                      textEditingController.clear();

                      // print(ingredientsController.ingredientsList);
                    }
                    focusNode.requestFocus();
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 18)),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: newRecipeController.ingredientsList.length,
                    itemBuilder: (context, index) {
                      final ingredient =
                          newRecipeController.ingredientsList[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Dismissible(
                          key: Key(ingredient),
                          onDismissed: (direction) {
                            newRecipeController.removeIngredientAtIndex(index);

                            // TODO:: snackbar style, undo functionality
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('$ingredient removed')));
                          },
                          child: IngredientCard(text: ingredient),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: accentPurple,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const CustomText(
                    text: "Generate Recipes",
                    color: light,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Container(
          width: 40,
          color: Colors.transparent,
        ),
        SizedBox(
          width: width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CustomText(
                text: "Recipes",
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
          ),
        ),
        Expanded(
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}

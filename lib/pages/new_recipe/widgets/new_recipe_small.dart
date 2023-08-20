import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/pages/new_recipe/widgets/ingredient_card.dart';
import 'package:chefgpt/pages/new_recipe/widgets/new_recipe_card.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class NewRecipeSmall extends StatelessWidget {
  const NewRecipeSmall({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    FocusNode focusNode = FocusNode();

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
                text: "Add Ingredients",
                size: 30,
              ),
              const SizedBox(height: 20),
              TextField(
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
                  }
                  focusNode.requestFocus();
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: newRecipeController.ingredientsList.length,
                    itemBuilder: (context, index) {
                      final ingredient =
                          newRecipeController.ingredientsList[index];
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
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
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    fixedSize: const Size(300, 60),
                    backgroundColor: accentPurple,
                  ),
                  onPressed: () => newRecipeController.generateRecipes(),
                  child: const CustomText(
                    text: "Generate Recipes",
                    color: light,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(text: "Number of recipes to generate:"),
              Obx(
                () => Slider.adaptive(
                  value: newRecipeController.numberOfRecipesToGenerate.value,
                  onChanged: (newValue) =>
                      newRecipeController.updateNumberToGenerate(newValue),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label:
                      "${newRecipeController.numberOfRecipesToGenerate.value}",
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(text: "Recipe strictness:"),
              Obx(
                () => Slider.adaptive(
                  value: newRecipeController.recipeStrictness.value,
                  onChanged: (newValue) =>
                      newRecipeController.updatStrictness(newValue),
                  min: 1,
                  max: 3,
                  divisions: 2,
                  label: newRecipeController.strictnessLevelMessage(
                      newRecipeController.recipeStrictness.value),
                  activeColor: newRecipeController.strictnessSliderColors(
                      newRecipeController.recipeStrictness.value),
                  inactiveColor: newRecipeController
                      .strictnessSliderColors(
                          newRecipeController.recipeStrictness.value)
                      .withAlpha(100),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Column(
                  children: newRecipeController.recipeTitlesList.isNotEmpty
                      ? [
                          const Divider(
                            color: lightGrey,
                            thickness: 2,
                          ),
                          const SizedBox(height: 20),
                          const CustomText(
                            text: "Recipes",
                            size: 30,
                          ),
                        ]
                      : [],
                ),
              ),
              const SizedBox(height: 20),
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
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }
}

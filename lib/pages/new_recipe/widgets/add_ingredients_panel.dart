import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/pages/new_recipe/widgets/ingredient_card.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddIngredientsPanel extends StatelessWidget {
  const AddIngredientsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    FocusNode focusNode = FocusNode();
    double width = MediaQuery.of(context).size.width * (5 / 6);

    return Column(
      mainAxisSize: MainAxisSize.min,
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
            labelText: "New Ingredient",
            labelStyle: const TextStyle(fontSize: 20),
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
              shrinkWrap: true,
              itemCount: newRecipeController.ingredientsList.length,
              itemBuilder: (context, index) {
                final ingredient = newRecipeController.ingredientsList[index];
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
        const CustomText(text: "Number of recipes to generate:"),
        Obx(
          () => Slider.adaptive(
            value: newRecipeController.numberOfRecipesToGenerate.value,
            onChanged: (newValue) =>
                newRecipeController.updateNumberToGenerate(newValue),
            min: 1,
            max: 5,
            divisions: 4,
            label: "${newRecipeController.numberOfRecipesToGenerate.value}",
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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            fixedSize: Size(width, 60),
            backgroundColor: accentPurple,
          ),
          onPressed: () => newRecipeController.generateRecipes(),
          child: const CustomText(
            text: "Generate Recipes",
            color: light,
            size: 24,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

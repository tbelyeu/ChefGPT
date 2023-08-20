import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/services/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRecipeController extends GetxController {
  static NewRecipeController instance = Get.find();

  listDynamicToListString(list) => list.whereType<String>().toList();

  List<String> cleanList(List<String> list) {
    return list.map((item) {
      final cleanedItem = item
          .replaceAll(
              RegExp(r'\d+\.\s+'), '') // Remove numbers at the beginning
          .trim(); // Trim leading/trailing spaces
      return cleanedItem;
    }).toList();
  }

  List ingredientsList = [].obs;
  addIngredient(ingredient) => ingredientsList.add(ingredient);
  removeIngredientAtIndex(index) => ingredientsList.removeAt(index);

  generateRecipes() async {
    String content = Chat().formatMessageContent(
      listOfIngredients: listDynamicToListString(ingredientsList),
      numberOfRecipes: numberOfRecipesToGenerate.round(),
      strictnessLevel: strictnessLevelMessage(recipeStrictness.value),
      dietaryRestrictionsAndPreferences:
          settingsController.dietaryPreference.value,
      foodAllergies: listDynamicToListString(settingsController.allergiesList),
      recipesList: listDynamicToListString(recipeTitlesList),
    );

    print(content);
    print("\n");

    var completion = await Chat().createChatCompletion(content);

    print(completion);
    processGeneratedRecipes(completion);
  }

  processGeneratedRecipes(String completion) {
    RegExp recipePattern = RegExp(r'<recipe>(.*?)<\/recipe>', dotAll: true);
    Iterable<RegExpMatch> matches = recipePattern.allMatches(completion);

    for (var match in matches) {
      final recipeText = match.group(1)!;
      final title = recipeTitleFromCompletion(recipeText);
      final ingredients = ingredientsListFromCompletion(recipeText);
      final instructions = instructionsListFromCompletion(recipeText);

      addRecipe(
        title,
        ingredients,
        instructions,
      );
    }
  }

  addRecipe(title, ingredients, instructions) {
    recipeTitlesList.add(title);
    recipeIngredientsList.add(ingredients);
    recipeInstructionsList.add(instructions);
    recipeStarred.add(false);
  }

  List recipeTitlesList = [].obs;
  String recipeTitleFromCompletion(String recipeText) {
    RegExp regEx = RegExp(r'(?<=<title>)(.*)(?=</title>)');
    var match = regEx.firstMatch(recipeText);
    if (match != null) {
      return match.group(0)!;
    } else {
      return "error";
    }
  }

  List recipeIngredientsList = [].obs;
  List<String> ingredientsListFromCompletion(String recipeText) {
    RegExp regEx = RegExp(
      r'(?<=<ingredients>)(.*?)(?=</ingredients>)',
      multiLine: true,
      dotAll: true,
    );
    var match = regEx.firstMatch(recipeText);
    if (match != null) {
      final ingredientsText = match.group(1)!.trim();
      final ingredientsList = ingredientsText
          .split('\n')
          .where((e) => e.isNotEmpty)
          .map((e) => e.replaceFirst('- ', ''))
          .toList();
      return cleanList(ingredientsList);
    } else {
      return ["error"];
    }
  }

  List recipeInstructionsList = [].obs;
  List<String> instructionsListFromCompletion(String recipeText) {
    RegExp regEx = RegExp(
      r'(?<=<instructions>)(.*?)(?=</instructions>)',
      multiLine: true,
      dotAll: true,
    );
    var match = regEx.firstMatch(recipeText);
    if (match != null) {
      final instructionsText = match.group(1)!.trim();
      final instructionsList = instructionsText
          .split('\n')
          .where((e) => e.isNotEmpty)
          .map((e) => e.replaceFirst(RegExp(r'^\d+\.\s+'), ''))
          .toList();
      return cleanList(instructionsList);
    } else {
      return ["error"];
    }
  }

  List recipeStarred = [].obs;
  toggleRecipeStarred(index) => recipeStarred[index] = !recipeStarred[index];

  var numberOfRecipesToGenerate = 3.0.obs;
  updateNumberToGenerate(newValue) =>
      numberOfRecipesToGenerate.value = newValue;

  var recipeStrictness = 1.0.obs;
  updatStrictness(newValue) => recipeStrictness.value = newValue;

  String strictnessLevelMessage(strictness) {
    switch (strictness) {
      case 1.0:
        return "Use only these ingredients";
      case 2.0:
        return "Use mostly these ingredients";
      case 3.0:
        return "Use any of these ingredients";
      default:
        return "error";
    }
  }

  Color strictnessSliderColors(strictness) {
    switch (strictness) {
      case 1.0:
        return Colors.red;
      case 2.0:
        return Colors.yellow;
      case 3.0:
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}

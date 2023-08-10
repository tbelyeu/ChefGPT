import 'package:get/get.dart';

class NewRecipeController extends GetxController {
  static NewRecipeController instance = Get.find();

  addIngredient(ingredient) => ingredientsList.add(ingredient);
  removeIngredientAtIndex(index) => ingredientsList.removeAt(index);

  List ingredientsList =
      ["2 apples", "half of a large carrot", "6 slices of wheat bread"].obs;

  List recipeIdList = ["1", "2"].obs;

  List recipesList =
      ["Cheddar Cheese Quesadilla", "American Cheese Quesadilla"].obs;

  List recipeIngredientsList = [
    [
      "Cheddar cheese (grated or sliced)",
      "Flour tortillas",
      "Cooking spray or butter"
    ],
    [
      "Cheddar cheese (grated or sliced)",
      "Flour tortillas",
      "Cooking spray or butter"
    ],
  ].obs;

  // bool test = Get.put();

  List recipeInstructionsList = [
    [
      "Heat a non-stick pan over medium heat.",
      "Place a flour tortilla on the pan and sprinkle cheddar cheese evenly on one half of the tortilla.",
      "Fold the tortilla in half to cover the cheese.",
      "Cook for 2-3 minutes on each side until the tortilla is golden and the cheese has melted.",
      "Remove from the pan, cut into wedges, and serve with your favorite salsa or guacamole."
    ],
    [
      "Heat a non-stick pan over medium heat.",
      "Place a flour tortilla on the pan and sprinkle cheddar cheese evenly on one half of the tortilla.",
      "Fold the tortilla in half to cover the cheese.",
      "Cook for 2-3 minutes on each side until the tortilla is golden and the cheese has melted.",
      "Remove from the pan, cut into wedges, and serve with your favorite salsa or guacamole."
    ],
  ].obs;

  List recipeStarred = [].obs;
  toggleRecipeStarred(index) => recipeStarred[index] = !recipeStarred[index];
}

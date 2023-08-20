import 'package:chefgpt/services/auth.dart';
import 'package:chefgpt/services/recipe.dart';
import 'package:get/get.dart';

class MyRecipesController extends GetxController {
  static MyRecipesController instance = Get.find();

  RxList savedRecipes = [].obs;

  Future updateSavedRecipes() async {
    if (Auth().userSignedIn()) {
      savedRecipes.value =
          await RecipeService().getAll(userId: Auth().currentUser!.uid);
    }
  }

  removeRecipeAtIndex(index) => savedRecipes.removeAt(index);
  addSavedRecipe(recipe) => savedRecipes.add(recipe);
}

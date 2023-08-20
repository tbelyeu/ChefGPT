import 'package:chefgpt/constants/firebase.dart';
import 'package:chefgpt/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RecipeService {
  final CollectionReference userCollection = firestore.collection("users");

  void createRecipe({
    required userId,
    required String title,
    required List<String> ingredients,
    required List<String> instructions,
  }) {
    userCollection.doc(userId).collection("recipes").add({
      "title": title,
      "ingredients": ingredients,
      "instructions": instructions,
    });
  }

  Future deleteRecipe({
    required userId,
    required String title,
    required List<String> ingredients,
    required List<String> instructions,
  }) async {
    // Get any recipes with the correct title
    QuerySnapshot querySnapshot = await userCollection
        .doc(userId)
        .collection("recipes")
        .where("title", isEqualTo: title)
        .get();

    // Make sure all fields are equal to the recipe we want to delete
    String recipeId = "";
    final recipes = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (int index = 0; index < recipes.length; index++) {
      var recipe = recipes[index] as Map<String, dynamic>;
      var _ingredients = recipe["ingredients"].whereType<String>().toList();
      var _instructions = recipe["instructions"].whereType<String>().toList();

      if (listEquals(_ingredients, ingredients) &&
          listEquals(_instructions, instructions)) {
        recipeId = querySnapshot.docs[index].id;
      }
    }

    // Exit if we didn't find a document id
    if (recipeId == "") {
      print("error finding recipeId");
      return;
    }

    // Delete recipe
    userCollection.doc(userId).collection("recipes").doc(recipeId).delete();
  }

  Future<List<RecipeModel>> getAll({required userId}) async =>
      userCollection.doc(userId).collection("recipes").get().then((result) {
        List<RecipeModel> recipes = [];
        for (DocumentSnapshot recipe in result.docs) {
          recipes.add(RecipeModel.fromSnapshot(recipe));
        }

        return recipes;
      });
}

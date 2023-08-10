import 'package:chefgpt/pages/authentication/sign_in.dart';
import 'package:chefgpt/pages/authentication/sign_up.dart';
import 'package:chefgpt/pages/my_recipes/my_recipes.dart';
import 'package:chefgpt/pages/new_recipe/new_recipe.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NewRecipePageRoute:
      return _getPageRoute(const NewRecipePage());
    case MyRecipesPageRoute:
      return _getPageRoute(const MyRecipesPage());
    case SignInPageRoute:
      return _getPageRoute(const SignInPage());
    case SignUpPageRoute:
      return _getPageRoute(const SignUpPage());
    default:
      return _getPageRoute(const NewRecipePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

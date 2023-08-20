import 'package:chefgpt/controllers/authentication_controller.dart';
import 'package:chefgpt/controllers/my_recipes_controller.dart';
import 'package:chefgpt/controllers/new_recipe_controller.dart';
import 'package:chefgpt/controllers/menu_controller.dart';
import 'package:chefgpt/controllers/navigation_controller.dart';
import 'package:chefgpt/controllers/settings_controller.dart';

SideMenuController menuController = SideMenuController.instance;
NavigationController navigationController = NavigationController.instance;
NewRecipeController newRecipeController = NewRecipeController.instance;
MyRecipesController myRecipesController = MyRecipesController.instance;
SettingsController settingsController = SettingsController.instance;
AuthenticationController authenticationController =
    AuthenticationController.instance;

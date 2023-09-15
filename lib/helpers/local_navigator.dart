import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/routing/router.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:flutter/material.dart';

Navigator LocalNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: HomePageRoute,
      onGenerateRoute: generateRoute,
    );

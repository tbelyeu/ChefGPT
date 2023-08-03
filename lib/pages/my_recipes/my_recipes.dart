import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MyRecipesPage extends StatelessWidget {
  const MyRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: "My Recipes"),
    );
  }
}

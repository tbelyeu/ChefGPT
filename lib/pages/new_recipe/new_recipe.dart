import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NewRecipePage extends StatelessWidget {
  const NewRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: "New Recipe"),
    );
  }
}

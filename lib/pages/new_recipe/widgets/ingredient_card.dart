import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String text;
  const IngredientCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: light,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomText(
          text: text,
          size: 20,
        ),
      ),
    );
  }
}

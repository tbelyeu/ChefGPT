import 'package:chefgpt/pages/settings/widgets/allergies_list.dart';
import 'package:chefgpt/pages/settings/widgets/dietary_preferences_list.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Expanded(
          child: ListView(
            children: const [
              SizedBox(height: 20),
              CustomText(
                text: "Settings",
                size: 30,
              ),
              SizedBox(height: 20),
              CustomText(
                text: "Dietary Restrictions and Preferences",
                size: 20,
              ),
              SizedBox(height: 20),
              DietaryPreferencesList(),
              SizedBox(height: 30),
              CustomText(
                text: "Food Allergies",
                size: 20,
              ),
              SizedBox(height: 20),
              FoodAllergiesList(),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietaryPreferencesList extends StatelessWidget {
  const DietaryPreferencesList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text =
        settingsController.otherDietaryPreferenceText.value;

    return Obx(
      () => Column(
        children: [
          RadioListTile(
            title: const CustomText(text: "None"),
            value: "None",
            groupValue: settingsController.dietaryPreference.value,
            onChanged: (value) {
              settingsController.dietaryPreference.value = value.toString();
              settingsController.deleteOtherDietaryPreference();
              print(settingsController.dietaryPreference.value);
            },
          ),
          RadioListTile(
            title: const CustomText(text: "Vegetarian"),
            value: "Vegetarian",
            groupValue: settingsController.dietaryPreference.value,
            onChanged: (value) {
              settingsController.dietaryPreference.value = value.toString();
              settingsController.deleteOtherDietaryPreference();
              print(settingsController.dietaryPreference.value);
            },
          ),
          RadioListTile(
            title: const CustomText(text: "Vegan"),
            value: "Vegan",
            groupValue: settingsController.dietaryPreference.value,
            onChanged: (value) {
              settingsController.dietaryPreference.value = value.toString();
              settingsController.deleteOtherDietaryPreference();
              print(settingsController.dietaryPreference.value);
            },
          ),
          RadioListTile(
            title: const CustomText(text: "Pescatarian"),
            value: "Pescatarian",
            groupValue: settingsController.dietaryPreference.value,
            onChanged: (value) {
              settingsController.dietaryPreference.value = value.toString();
              settingsController.deleteOtherDietaryPreference();
              print(settingsController.dietaryPreference.value);
            },
          ),
          RadioListTile(
            title: const CustomText(text: "Flexitarian"),
            value: "Flexitarian",
            groupValue: settingsController.dietaryPreference.value,
            onChanged: (value) {
              settingsController.dietaryPreference.value = value.toString();
              settingsController.deleteOtherDietaryPreference();
              print(settingsController.dietaryPreference.value);
            },
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
                child: RadioListTile(
                  title: const CustomText(text: "Other"),
                  value: textEditingController.text,
                  groupValue: settingsController.dietaryPreference.value,
                  onChanged: (value) {
                    settingsController.dietaryPreference.value =
                        textEditingController.text;
                    settingsController
                        .setOtherDietaryPreference(textEditingController.text);
                    print(settingsController.dietaryPreference.value);
                  },
                ),
              ),
              SizedBox(
                width: width / 2,
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: darkGrey),
                    ),
                  ),
                  onSubmitted: (value) {
                    settingsController.dietaryPreference.value = value;
                    settingsController.setOtherDietaryPreference(value);
                    print(settingsController.dietaryPreference.value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

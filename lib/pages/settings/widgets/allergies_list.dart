import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodAllergiesList extends StatelessWidget {
  const FoodAllergiesList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = settingsController.otherAllergiesText.value;

    return Obx(
      () => Column(
        children: [
          CheckboxListTile(
            title: const CustomText(text: "Milk"),
            controlAffinity: ListTileControlAffinity.leading,
            value: settingsController.isCheckedList[0],
            onChanged: (value) {
              settingsController.isCheckedList[0] = value!;

              if (settingsController.isCheckedList[0]) {
                settingsController.allergiesList.add("Milk");
              } else {
                settingsController.allergiesList.remove("Milk");
              }

              print(settingsController.allergiesList);
            },
          ),
          CheckboxListTile(
            title: const CustomText(text: "Eggs"),
            controlAffinity: ListTileControlAffinity.leading,
            value: settingsController.isCheckedList[1],
            onChanged: (value) {
              settingsController.isCheckedList[1] = value!;

              if (settingsController.isCheckedList[1]) {
                settingsController.allergiesList.add("Eggs");
              } else {
                settingsController.allergiesList.remove("Eggs");
              }

              print(settingsController.allergiesList);
            },
          ),
          CheckboxListTile(
            title: const CustomText(text: "Fish"),
            controlAffinity: ListTileControlAffinity.leading,
            value: settingsController.isCheckedList[2],
            onChanged: (value) {
              settingsController.isCheckedList[2] = value!;

              if (settingsController.isCheckedList[2]) {
                settingsController.allergiesList.add("Fish");
              } else {
                settingsController.allergiesList.remove("Fish");
              }

              print(settingsController.allergiesList);
            },
          ),
          CheckboxListTile(
            title: const CustomText(text: "Shellfish"),
            controlAffinity: ListTileControlAffinity.leading,
            value: settingsController.isCheckedList[3],
            onChanged: (value) {
              settingsController.isCheckedList[3] = value!;

              if (settingsController.isCheckedList[3]) {
                settingsController.allergiesList.add("Shellfish");
              } else {
                settingsController.allergiesList.remove("Shellfish");
              }

              print(settingsController.allergiesList);
            },
          ),
          CheckboxListTile(
            title: const CustomText(text: "Tree nuts"),
            controlAffinity: ListTileControlAffinity.leading,
            value: settingsController.isCheckedList[4],
            onChanged: (value) {
              settingsController.isCheckedList[4] = value!;

              if (settingsController.isCheckedList[4]) {
                settingsController.allergiesList.add("Tree nuts");
              } else {
                settingsController.allergiesList.remove("Tree nuts");
              }

              print(settingsController.allergiesList);
            },
          ),
          CheckboxListTile(
            title: const CustomText(text: "Peanuts"),
            controlAffinity: ListTileControlAffinity.leading,
            value: settingsController.isCheckedList[5],
            onChanged: (value) {
              settingsController.isCheckedList[5] = value!;

              if (settingsController.isCheckedList[5]) {
                settingsController.allergiesList.add("Peanuts");
              } else {
                settingsController.allergiesList.remove("Peanuts");
              }

              print(settingsController.allergiesList);
            },
          ),
          CheckboxListTile(
            title: const CustomText(text: "Wheat"),
            controlAffinity: ListTileControlAffinity.leading,
            value: settingsController.isCheckedList[6],
            onChanged: (value) {
              settingsController.isCheckedList[6] = value!;

              if (settingsController.isCheckedList[6]) {
                settingsController.allergiesList.add("Wheat");
              } else {
                settingsController.allergiesList.remove("Wheat");
              }

              print(settingsController.allergiesList);
            },
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: CheckboxListTile(
                  title: const CustomText(text: "Other, List all"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: settingsController.isCheckedList[7],
                  onChanged: (value) {
                    settingsController.isCheckedList[7] = value!;

                    if (settingsController.isCheckedList[7]) {
                      settingsController.allergiesList.add(
                          "Other allergies: ${textEditingController.text}");
                      settingsController
                          .setOtherAllergies(textEditingController.text);
                    } else {
                      settingsController.allergiesList.removeWhere((element) =>
                          element.toString().contains("Other allergies"));
                      settingsController.deleteOtherAllergies();
                    }

                    print(settingsController.allergiesList);
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
                    if (settingsController.isCheckedList[7]) {
                      settingsController.allergiesList.removeWhere((element) =>
                          element.toString().contains("Other allergies"));
                      settingsController.allergiesList.add(
                          "Other allergies: ${textEditingController.text}");
                    } else {
                      settingsController.isCheckedList[7] = true;
                      settingsController.allergiesList.add(
                          "Other allergies: ${textEditingController.text}");
                    }
                    settingsController
                        .setOtherAllergies(textEditingController.text);

                    print(settingsController.allergiesList);
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

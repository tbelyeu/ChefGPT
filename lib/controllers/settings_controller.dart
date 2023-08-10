import 'package:get/get.dart';

class SettingsController extends GetxController {
  static SettingsController instance = Get.find();

  var dietaryPreference = "None".obs;
  var allergiesList = [].obs;
  var isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  var otherDietaryPreferenceText = "".obs;

  setOtherDietaryPreference(String text) =>
      otherDietaryPreferenceText.value = text;

  deleteOtherDietaryPreference() => otherDietaryPreferenceText.value = "";

  var otherAllergiesText = "".obs;

  setOtherAllergies(String text) => otherAllergiesText.value = text;

  deleteOtherAllergies() => otherAllergiesText.value = "";
}

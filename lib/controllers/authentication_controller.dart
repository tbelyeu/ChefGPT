import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/firebase.dart';
import 'package:chefgpt/models/user.dart';
import 'package:chefgpt/services/user.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController instance = Get.find();

  var userSignedIn = false.obs;
  var user = UserModel().obs;

  Future initUser() async {
    if (auth.currentUser != null) {
      UserModel fetchedUser =
          await UserService().getUserById(auth.currentUser!.uid);
      user.value = fetchedUser;
      userSignedIn.value = true;
      menuController.toggleSideMenuItems();
    }
  }

  var signUpPasswordVisible = false.obs;
  toggleSignUpPasswordVisibility() =>
      signUpPasswordVisible.value = !signUpPasswordVisible.value;

  var signInPasswordVisible = false.obs;
  toggleSignInPasswordVisibility() =>
      signInPasswordVisible.value = !signInPasswordVisible.value;
}

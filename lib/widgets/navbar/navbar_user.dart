import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarUser extends StatelessWidget {
  const NavBarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authenticationController.userSignedIn.value
          ? Row(
              children: [
                Container(
                  width: 2,
                  height: 22,
                  color: dark,
                ),
                const SizedBox(width: 20),
                CustomText(
                  text: authenticationController.user.value.name,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: ClipOval(
                    child: Image.network(
                      authenticationController.user.value.photo,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}

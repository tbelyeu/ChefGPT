import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/pages/authentication/widgets/sign_in_button.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:chefgpt/services/auth.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();
    FocusNode passwordFocusNode = FocusNode();
    FocusNode buttonFocusNode = FocusNode();
    double width = MediaQuery.of(context).size.width;
    // if (!ResponsiveWidget.isSmallScreen(context)) {
    //   width = width / 2;
    // } else {
    //   width = width * (3 / 4);
    // }
    if (platformController.isMobile.value) {
      width = width - 60;
    } else {
      width = width / 2;
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        const CustomText(
          text: "Sign In",
          size: 30,
        ),
        const SizedBox(height: 20),
        SignInButton(
          isEnabled: true,
          width: width,
          text: "Continue with Google",
          image: "icons/google.png",
          onPressed: () => Auth().signInWith(Provider.Google),
        ),
        const SizedBox(height: 10),
        SignInButton(
          isEnabled: false,
          width: width,
          text: "Continue with Apple",
          image: "icons/apple.png",
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        SignInButton(
          isEnabled: false,
          width: width,
          text: "Continue with Facebook",
          image: "icons/facebook.png",
          onPressed: () {},
          //  => Auth().signIn(Provider.Facebook),
        ),
        const SizedBox(height: 20),
        const CustomText(
          text: "or",
          color: darkGrey,
          size: 20,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: width,
          height: 46,
          child: TextField(
            controller: emailTextEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: lightGrey),
              ),
              labelText: "Email",
              labelStyle: TextStyle(fontSize: 20),
            ),
            onSubmitted: (value) {
              passwordFocusNode.requestFocus();
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width,
          height: 46,
          child: Obx(
            () => TextField(
              controller: passwordTextEditingController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: lightGrey),
                  ),
                  labelText: "Password",
                  labelStyle: const TextStyle(fontSize: 20),
                  suffixIcon: IconButton(
                    icon: authenticationController.signInPasswordVisible.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () => authenticationController
                        .toggleSignInPasswordVisibility(),
                  )),
              obscureText:
                  !authenticationController.signInPasswordVisible.value,
              focusNode: passwordFocusNode,
              onSubmitted: (value) {
                buttonFocusNode.requestFocus();
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(width, 46),
            backgroundColor: accentPurple,
          ),
          focusNode: buttonFocusNode,
          onPressed: () {
            Auth().signInWithEmailAndPassword(emailTextEditingController.text,
                passwordTextEditingController.text);

            print("pressed");
            buttonFocusNode.unfocus();
          },
          child: const CustomText(
            text: "Continue",
            color: light,
            size: 20,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "New to ChefGPT?",
              color: darkGrey,
            ),
            TextButton(
              onPressed: () => navigationController.navigateTo(SignUpPageRoute),
              child: const CustomText(
                text: "Sign up",
                color: accentPurple,
              ),
            )
          ],
        )
      ],
    );
  }
}

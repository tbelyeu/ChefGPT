import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/pages/authentication/widgets/sign_in_button.dart';
import 'package:chefgpt/routing/routes.dart';
import 'package:chefgpt/services/auth.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController nameTextEditingController = TextEditingController();
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();
    FocusNode passwordFocusNode = FocusNode();
    FocusNode emailFocusNode = FocusNode();
    FocusNode buttonFocusNode = FocusNode();

    return Column(
      children: [
        const SizedBox(height: 20),
        const CustomText(
          text: "Sign Up",
          size: 30,
        ),
        const SizedBox(height: 20),
        SignInButton(
          text: "Continue with Google",
          image: "icons/google.png",
          onPressed: () => Auth().signInWith(Provider.Google),
        ),
        const SizedBox(height: 10),
        SignInButton(
          text: "Continue with Apple",
          image: "icons/apple.png",
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        SignInButton(
          text: "Continue with Facebook",
          image: "icons/facebook.png",
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        const CustomText(
          text: "or",
          color: darkGrey,
          size: 20,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: width / 2,
          height: 46,
          child: TextField(
            controller: nameTextEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: lightGrey),
              ),
              labelText: "Name",
              labelStyle: TextStyle(fontSize: 20),
            ),
            onSubmitted: (value) {
              emailFocusNode.requestFocus();
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width / 2,
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
            focusNode: emailFocusNode,
            onSubmitted: (value) {
              passwordFocusNode.requestFocus();
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width / 2,
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
                    icon: authenticationController.signUpPasswordVisible.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () => authenticationController
                        .toggleSignUpPasswordVisibility(),
                  )),
              obscureText:
                  !authenticationController.signUpPasswordVisible.value,
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
            fixedSize: Size(width / 2, 46),
            backgroundColor: accentPurple,
          ),
          focusNode: buttonFocusNode,
          onPressed: () {
            Auth().signUpWithEmailAndPassword(
              nameTextEditingController.text,
              emailTextEditingController.text,
              passwordTextEditingController.text,
            );

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
              text: "Already have an account?",
              color: darkGrey,
            ),
            TextButton(
              onPressed: () => navigationController.navigateTo(SignInPageRoute),
              child: const CustomText(
                text: "Sign in",
                color: accentPurple,
              ),
            )
          ],
        )
      ],
    );
  }
}

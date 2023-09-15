import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final bool isEnabled;
  final double width;
  final String text;
  final String image;
  final void Function() onPressed;
  const SignInButton({
    super.key,
    required this.isEnabled,
    required this.width,
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        enableFeedback: isEnabled ? true : false,
        backgroundColor: isEnabled
            ? const MaterialStatePropertyAll(light)
            : MaterialStatePropertyAll(Colors.grey.shade300),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        fixedSize: MaterialStateProperty.all(Size(width, 46)),
        side: MaterialStateProperty.all(const BorderSide(color: lightGrey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: platformController.isMobile.value ? 64 : 32,
          ),
          const SizedBox(width: 20),
          CustomText(
            text: text,
            color: dark,
            size: platformController.isMobile.value ? 16 : 20,
          ),
        ],
      ),
    );
  }
}

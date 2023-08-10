import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final String image;
  const SignInButton({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        fixedSize: MaterialStateProperty.all(Size(width / 2, 46)),
        side: MaterialStateProperty.all(const BorderSide(color: lightGrey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 32,
          ),
          const SizedBox(width: 20),
          CustomText(
            text: text,
            color: dark,
            size: 20,
          ),
        ],
      ),
    );
  }
}

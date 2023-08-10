import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NavBarUser extends StatelessWidget {
  const NavBarUser({super.key});

  @override
  Widget build(BuildContext context) {
    bool loggedIn = false;
    if (loggedIn) {
      return Row(
        children: [
          Container(
            width: 2,
            height: 22,
            color: dark,
          ),
          const SizedBox(width: 20),
          const CustomText(
            text: "Tyler Belyeu",
            size: 20,
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: const CircleAvatar(
              backgroundColor: pastelGreen,
              child: Icon(
                Icons.account_circle,
                color: dark,
                size: 40,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}

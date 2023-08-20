import 'package:chefgpt/constants/style.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool unreadNotifications = true;
    if (unreadNotifications) {
      return Stack(
        children: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: dark,
            ),
            onPressed: () {},
          ),
          Positioned(
            top: 7,
            right: 7,
            child: Container(
              width: 12,
              height: 12,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: accentPurple,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: light, width: 2),
              ),
            ),
          )
        ],
      );
    } else {
      return IconButton(
        icon: const Icon(
          Icons.notifications,
          color: dark,
        ),
        onPressed: () {},
      );
    }
  }
}

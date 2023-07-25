import 'package:flutter/material.dart';

const int largeScreenSize = 2000;
const int mediumScreenSize = 1500;
const int smallScreenSize = 750;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget(
      {super.key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen});

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= smallScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > smallScreenSize &&
      MediaQuery.of(context).size.width <= mediumScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > mediumScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      double width = constraints.maxWidth;
      if (width > mediumScreenSize) {
        return largeScreen;
      } else if (width > smallScreenSize && width <= mediumScreenSize) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    }));
  }
}

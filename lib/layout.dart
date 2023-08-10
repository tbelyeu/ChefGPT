import 'package:chefgpt/helpers/responsiveness.dart';
import 'package:chefgpt/widgets/large_screen.dart';
import 'package:chefgpt/widgets/side_menu/side_menu.dart';
import 'package:chefgpt/widgets/small_screen.dart';
import 'package:chefgpt/widgets/navbar/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(child: SideMenu()),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        mediumScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}

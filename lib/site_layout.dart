import 'package:flutter/material.dart';
import 'package:web_app/constants/app_keys.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/screens/large_screen.dart';
import 'package:web_app/screens/small_screen.dart';
import 'package:web_app/widgets/side_menu/side_menu.dart';
import 'package:web_app/widgets/site_app_bar.dart';

/// the main screen and site layout
class SiteLayout extends StatelessWidget {
  /// constructor
  const SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AppKeys.siteLayout,
      drawer: const Drawer(child: SideMenu()),
      appBar: SiteAppBar(siteLayoutKey: AppKeys.siteLayout),
      body: context.isSmallScreen ? const SmallScreen() : const LargeScreen(),
    );
  }
}

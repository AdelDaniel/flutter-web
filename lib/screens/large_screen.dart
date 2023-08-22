import 'package:flutter/material.dart';
import 'package:web_app/config/router/app_routing.dart';
import 'package:web_app/widgets/side_menu/side_menu.dart';

/// Large Screen For the Web
class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: SideMenu()),
        Expanded(
          flex: 5,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: localNavigator,),
        )
      ],
    );
  }
}

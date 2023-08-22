import 'package:flutter/material.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/models/side_menu_item_type.dart';
import 'package:web_app/widgets/side_menu/horizontal_menu_item.dart';
import 'package:web_app/widgets/side_menu/vertical_menu_item.dart';

/// side menu
class SideMenuItem extends StatelessWidget {

  const SideMenuItem({
    required this.sideMenuItemType, required this.onTap, super.key,
  });
  final SideMenuItemType sideMenuItemType;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    if (context.isCustomSize) {
      return VerticalMenuItem(
        sideMenuItemType: sideMenuItemType,
        onTap: onTap,
      );
    } else {
      return HorizontalMenuItem(
        sideMenuItemType: sideMenuItemType,
        onTap: onTap,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/controllers/app_menu_controller.dart';
import 'package:web_app/extensions/localizations_values.dart';
import 'package:web_app/models/side_menu_item_type.dart';
import 'package:web_app/widgets/custom_text.dart';

/// Single menu item Vertical
class VerticalMenuItem extends StatelessWidget {

  const VerticalMenuItem({
    required this.sideMenuItemType, required this.onTap, super.key,
  });
  final SideMenuItemType sideMenuItemType;
  final Function onTap;

  AppMenuController get _appMenuController => Controllers.appMenuController;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => _appMenuController.onHover(sideMenuItemType),
      onTap: () {
        onTap();
        _appMenuController.activateItem = sideMenuItemType;
      },
      child: Obx(
        () => ColoredBox(
          color: _appMenuController.isHovering(sideMenuItemType)
              ? AppColors.lightGrey.withOpacity(.1)
              : AppColors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: _appMenuController.isHovering(sideMenuItemType) ||
                    _appMenuController.isActive(sideMenuItemType),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(sideMenuItemType.icon, color: _iconColor),
                    ),
                    if (!_appMenuController.isActive(sideMenuItemType))
                      Flexible(
                        child: CustomText(
                          context
                              .translate(sideMenuItemType.displayLangKeyName),
                          color: _appMenuController.isHovering(sideMenuItemType)
                              ? AppColors.dark
                              : AppColors.lightGrey,
                        ),
                      )
                    else
                      Flexible(
                        child: CustomText(
                          context
                              .translate(sideMenuItemType.displayLangKeyName),
                          color: AppColors.white,
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color get _iconColor {
    if (_appMenuController.isActive(sideMenuItemType)) {
      return AppColors.dark;
    }

    return _appMenuController.isHovering(sideMenuItemType)
        ? AppColors.dark
        : AppColors.lightGrey;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/controllers/app_menu_controller.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/models/side_menu_item_type.dart';
import 'package:web_app/widgets/custom_text.dart';
import 'package:web_app/widgets/side_menu/side_menu_item.dart';

/// side menu
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  AppMenuController get _menuController => Controllers.appMenuController;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.light,
      child: ListView(
        children: [
          if (context.isSmallScreen)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: context.width / 48),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: FlutterLogo(),
                    ),
                    Flexible(
                      child: CustomText(
                        context.translate(LangKeys.appName),
                        size: 20,
                        weight: FontWeight.bold,
                        color: AppColors.active,
                      ),
                    ),
                    SizedBox(width: context.width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: AppColors.lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: SideMenuItemType.values
                .map(
                  (item) => SideMenuItem(
                    sideMenuItemType: item,
                    onTap: () {
                      // if (item.route == authenticationPageRoute) {
                      //   Get.offAllNamed(authenticationPageRoute);
                      //   menuController
                      //       .changeActiveItemTo(overviewPageDisplayName);
                      // }
                      if (!_menuController.isActive(item)) {
                        _menuController.activateItem = item;

                        Controllers.localNavigationService
                            .pushNamed(item.pageRoute);

                        if (context.isSmallScreen) {
                          // Navigator.of(context).pop();
                          AppKeys.siteLayout.currentState?.closeDrawer();
                        }
                        // navigationController.navigateTo(item.route);
                      }
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

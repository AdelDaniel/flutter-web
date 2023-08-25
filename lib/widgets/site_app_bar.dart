import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/config/router/routes_name.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/extensions/extensions.dart';
import 'package:web_app/widgets/custom_text.dart';

/// the website app bar
class SiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// constructor
  const SiteAppBar({required this.siteLayoutKey, super.key});

  /// the key of the scaffold that contains this app bar
  final GlobalKey<ScaffoldState> siteLayoutKey;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !context.isSmallScreen
          ? const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: FlutterLogo(size: 28),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                siteLayoutKey.currentState?.openDrawer();
              },
            ),
      title: Row(
        children: [
          Visibility(
            visible: !context.isSmallScreen,
            child: CustomText(
              context.translate(LangKeys.welcome),
              color: AppColors.lightGrey,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Obx(
            () => CustomText(
              context.translate(
                Controllers.appMenuController.activateItem.displayLangKeyName,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.dark),
            onPressed: () {
              context.goNamed(RoutesName.notificationsPageRoute);
            },
          ),
          IconButton(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Controllers.languageController.otherLanguageName),
                const Icon(Icons.language_rounded),
              ],
            ),
            onPressed: Controllers.languageController.toggleLanguage,
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: AppColors.dark.withOpacity(.7),
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
                    color: AppColors.active,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.light, width: 2),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: AppColors.lightGrey,
          ),
          const SizedBox(width: 16),
          if (!context.isSmallScreen)
            CustomText(
              context.translate(LangKeys.appName),
              color: AppColors.lightGrey,
            ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.active.withOpacity(.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: const CircleAvatar(
                backgroundColor: AppColors.light,
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.dark,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: const IconThemeData(color: AppColors.dark),
      elevation: 0,
      backgroundColor: AppColors.transparent,
    );
  }
}

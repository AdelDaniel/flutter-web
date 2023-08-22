import 'package:flutter/material.dart';
import 'package:web_app/config/lang/lang_keys.dart';
import 'package:web_app/config/router/routes_name.dart';

const IconData overviewIcon = Icons.trending_up;
const IconData driversIcon = Icons.drive_eta;
const IconData clientsIcon = Icons.people_alt_outlined;
const IconData authenticationIcon = Icons.exit_to_app;

enum SideMenuItemType {
  overview(
    displayLangKeyName: LangKeys.overview,
    pageRoute: RoutesName.overviewPageRoute,
    icon: overviewIcon,
  ),
  drivers(
    displayLangKeyName: LangKeys.drivers,
    pageRoute: RoutesName.driversPageRoute,
    icon: driversIcon,
  ),
  clients(
    displayLangKeyName: LangKeys.clients,
    pageRoute: RoutesName.clientsPageRoute,
    icon: clientsIcon,
  ),
  authentication(
    displayLangKeyName: LangKeys.authentication,
    pageRoute: RoutesName.authenticationPageRoute,
    icon: authenticationIcon,
  );

  const SideMenuItemType({
    required this.displayLangKeyName,
    required this.pageRoute,
    required this.icon,
  });

  final String displayLangKeyName;
  final String pageRoute;
  final IconData icon;
}

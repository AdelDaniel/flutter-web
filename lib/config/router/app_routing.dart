import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_app/config/router/routes_name.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/pages/notifications_page.dart';
import 'package:web_app/site_layout.dart';

Route<dynamic> _onGlobalGenerateRoute(RouteSettings settings) {
  log('Current Page is: ${settings.name}');

  switch (settings.name) {
    case RoutesName.siteLayoutPageRoute:
      return _route(
        RoutesName.siteLayoutPageRoute,
        const SiteLayout(),
      );
    case RoutesName.notificationsPageRoute:
      return _route(
        RoutesName.notificationsPageRoute,
        const NotificationsPage(),
      );

    default:
      return _errorRoute();
  }
}

Route<dynamic> _errorRoute() => MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const Center(
            child: Text(
              'Oops! \n SomeThing went Wrong',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

Route<dynamic> _route(String routeName, Widget page) => MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => page,
    );

Navigator get appGlobalNavigator => Navigator(
      key: AppKeys.appNavigatorKey,
      onGenerateRoute: _onGlobalGenerateRoute,
      initialRoute: RoutesName.siteLayoutPageRoute,
    );

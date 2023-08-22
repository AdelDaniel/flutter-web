import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_app/config/router/routes_name.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/pages/authentication/authantication.dart';
import 'package:web_app/pages/clients/clients.dart';
import 'package:web_app/pages/drivers/drivers.dart';
import 'package:web_app/pages/notifications_page.dart';
import 'package:web_app/pages/overview/overview.dart';
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

Route<dynamic> _onLocalGenerateRoute(RouteSettings settings) {
  log('Current Page is: ${settings.name}');

  switch (settings.name) {
    case RoutesName.authenticationPageRoute:
      return _route(
        RoutesName.authenticationPageRoute,
        const AuthenticationPage(),
      );
    case RoutesName.clientsPageRoute:
      return _route(
        RoutesName.clientsPageRoute,
        const ClientsPage(),
      );
    case RoutesName.driversPageRoute:
      return _route(
        RoutesName.driversPageRoute,
        const DriversPage(),
      );
    case RoutesName.overviewPageRoute:
      return _route(
        RoutesName.overviewPageRoute,
        const OverviewPage(),
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

Navigator get localNavigator => Navigator(
      key: AppKeys.localAppNavigatorKey,
      onGenerateRoute: _onLocalGenerateRoute,
      initialRoute: RoutesName.overviewPageRoute,
    );

Navigator get appGlobalNavigator => Navigator(
      key: AppKeys.appNavigatorKey,
      onGenerateRoute: _onGlobalGenerateRoute,
      initialRoute: RoutesName.siteLayoutPageRoute,
    );

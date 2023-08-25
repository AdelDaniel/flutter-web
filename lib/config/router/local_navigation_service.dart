import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/config/router/routes_name.dart';
import 'package:web_app/pages/authentication/authentication.dart';
import 'package:web_app/pages/clients/clients.dart';
import 'package:web_app/pages/drivers/drivers.dart';
import 'package:web_app/pages/overview/overview.dart';
import 'package:web_app/pages/page_not_found/page_not_found.dart';

/// contains Navigation Service
class LocalNavigationService {
  /// Create Constructor That take GlobalKey<NavigatorState>
  const LocalNavigationService(this._localAppNavigatorKey);

  /// return instance of LocalNavigationService
  static final LocalNavigationService instance =
      Get.find<LocalNavigationService>();

  final GlobalKey<NavigatorState> _localAppNavigatorKey;
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
        return _route(
          RoutesName.pageNotFound,
          const PageNotFound(),
        );
    }
  }

  Navigator get localNavigator => Navigator(
        key: _localAppNavigatorKey,
        onGenerateRoute: _onLocalGenerateRoute,
        initialRoute: RoutesName.overviewPageRoute,
      );

  Route<dynamic> _route(String routeName, Widget page) =>
      _FadeRoute(name: routeName, child: page);

  /// Push a named route onto the navigator.
  Future<dynamic> pushNamed(String routeName) {
    return _localAppNavigatorKey.currentState!.pushNamed(routeName);
  }

  /// Pop the top-most route off the navigator.
  void pop() {
    return _localAppNavigatorKey.currentState!.pop();
  }
}

class _FadeRoute<T> extends PageRouteBuilder<T> {
  _FadeRoute({required this.name, required this.child})
      : super(
          settings: RouteSettings(
            name: name,
          ),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final Widget child;
  final String name;
}

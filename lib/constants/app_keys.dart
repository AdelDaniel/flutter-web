import 'package:flutter/material.dart';

/// Global Keys used in the app
abstract final class AppKeys {
  const AppKeys._();

  /// the site layout key
  static final GlobalKey<ScaffoldState> siteLayout = GlobalKey<ScaffoldState>();

  /// Global key of navigation
  static final GlobalKey<NavigatorState> localAppNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> appNavigatorKey =
      GlobalKey<NavigatorState>();
}

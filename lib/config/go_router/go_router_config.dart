import 'package:go_router/go_router.dart';
import 'package:web_app/config/router/routes_name.dart';
import 'package:web_app/constants/constants.dart';
import 'package:web_app/pages/authentication/authentication.dart';
import 'package:web_app/pages/clients/clients.dart';
import 'package:web_app/pages/drivers/drivers.dart';
import 'package:web_app/pages/notifications_page.dart';
import 'package:web_app/pages/overview/overview.dart';
import 'package:web_app/pages/page_not_found/page_not_found.dart';
import 'package:web_app/site_layout.dart';

abstract final class GoRouterConfig {
  /// const constructor
  const GoRouterConfig();

  /// GoRouter configuration
  static final mainRouter = GoRouter(
    initialLocation: RoutesName.siteLayoutPageRoute,
    navigatorKey: AppKeys.appNavigatorKey,
    errorBuilder: (context, state) => const PageNotFound(),
    routes: [
      GoRoute(
        path: RoutesName.siteLayoutPageRoute,
        name: RoutesName.siteLayoutPageRoute,
        builder: (context, state) => const SiteLayout(),
        // routes: _siteLayoutPages,
      ),
      GoRoute(
        path: RoutesName.notificationsPageRoute,
        name: RoutesName.notificationsPageRoute,
        builder: (context, state) => const NotificationsPage(),
      ),
    ],
    debugLogDiagnostics: true,
  );

  static final List<RouteBase> _siteLayoutPages = [
    GoRoute(
      path: RoutesName.authenticationPageRoute,
      name: RoutesName.authenticationPageRoute,
      builder: (state, context) => const AuthenticationPage(),
    ),
    GoRoute(
      path: RoutesName.clientsPageRoute,
      name: RoutesName.clientsPageRoute,
      builder: (state, context) => const ClientsPage(),
    ),
    GoRoute(
      path: RoutesName.driversPageRoute,
      name: RoutesName.driversPageRoute,
      builder: (state, context) => const DriversPage(),
    ),
    GoRoute(
      path: RoutesName.overviewPageRoute,
      name: RoutesName.overviewPageRoute,
      builder: (state, context) => const OverviewPage(),
    ),
  ];
}

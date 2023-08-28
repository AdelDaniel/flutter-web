import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_app/config/lang/models/l10n.dart';
import 'package:web_app/config/router/app_routing.dart';
import 'package:web_app/constants/constants.dart';

/// The route widget Of the app
class App extends StatelessWidget {
  /// constructor
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: BouncingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        debugLog: true,
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansArabicTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      locale: Controllers.languageController.locale,
      fallbackLocale: Controllers.languageController.locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,
      localeResolutionCallback: L10n.localeResolutionCallback,
      initialRoute: appGlobalNavigator.initialRoute,
      onGenerateRoute: appGlobalNavigator.onGenerateRoute,
      navigatorKey: AppKeys.appNavigatorKey,
    );
  }
}

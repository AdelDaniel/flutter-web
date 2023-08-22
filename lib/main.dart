import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_app/app.dart';
import 'package:web_app/config/controller/language_controller.dart';
import 'package:web_app/config/router/local_navigation_service.dart';
import 'package:web_app/controllers/app_menu_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  _googleFontsLicense();
  _getLazyPut();

  /// Run App
  runApp(const App());
}

void _googleFontsLicense() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}

void _getLazyPut() {
  Get
    ..lazyPut(LanguageController.new)
    ..lazyPut(AppMenuController.new)
    ..lazyPut(() => LocalNavigationService(GlobalKey<NavigatorState>()));
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:web_app/config/lang/app_localizations.dart';
import 'package:web_app/config/lang/models/models.dart';

/// the list of our supported locals for our app
/// currently we support only 2 English and Arabic ...
abstract final class L10n {
  const L10n._();

  /// All The App Locales
  static const List<AppLocale> allAppLocales = [
    AllAppLocales.arabicEg,
    AllAppLocales.englishUs,
  ];

  /// Supported locales by the app
  static List<Locale> get supportedLocales =>
      allAppLocales.map((language) => language.locale).toList();

  /// These delegates make sure that the localization data
  /// for the proper language is loaded
  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    // A class which loads the translations from JSON files
    // delegate is a bridge between flutter and our app localization
    AppLocalizations.delegate,
    // Built-in localization of basic text for Material widgets
    GlobalMaterialLocalizations.delegate,
    // Built-in localization for text direction LTR/RTL
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,

    DefaultCupertinoLocalizations.delegate
  ];

  /// Returns a locale which will be used by the app
  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    /// Check if the current device locale is in our supported locales list
    /// That we added previously -->
    /// supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
    if (locale == null) {
      return supportedLocales.first;
    }
    // Check if the current device locale is supported
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    // If the locale of the device is not supported, use the first one
    // from the list (English, in this case).
    return supportedLocales.first;
  }
}

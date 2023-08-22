import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;
import 'package:web_app/config/lang/app_localizations.dart';
import 'package:web_app/config/lang/models/supported_language_code.dart';

/// Delegate class of AppLocalizations
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  /// This delegate instance will never change (it doesn't even have fields!)
  /// It can provide a constant constructor.
  const AppLocalizationsDelegate();

  /// Include all of your supported language codes here
  @override
  bool isSupported(Locale locale) {
    return SupportedLanguageCode.values
        .map((e) => e.name)
        .toList()
        .contains(locale.languageCode);
  }

  /// AppLocalizations class is where the JSON loading actually runs
  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_app/config/lang/app_localizations_delegate.dart';

/// AppLocalizations class used to
/// load files of translations and translate lang keys
class AppLocalizations {
  /// create singleton localization
  factory AppLocalizations(Locale locale) {
    _instance = AppLocalizations._(locale);
    return _instance!;
  }
  AppLocalizations._(this.locale);
  static late AppLocalizations? _instance;

  /// get the instance of AppLocalizations
  static AppLocalizations get i => _instance!;

  /// The current App local
  final Locale locale;

  /// inherited widget
  /// so no need to write the code in the method each time you need to translate
  /// new word
  /// Helper method to keep the code in the widgets concise
  /// Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  /// Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  /// how data will loaded from json >> it will Map
  late final Map<String, String> _localizedStrings;

  /// Loading the file that contains translation
  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    final jsonString =
        await rootBundle.loadString('languages/${locale.languageCode}.json');

    // decode the json form the lang file.
    // mapping the json string that we loaded from the file to json map
    // with dynamic value.
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    // convert the dynamic value from json file to Map<string, string >
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    // just return true because the method is Future<bool>
    return true;
  }

  /// This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key]!;
  }
}

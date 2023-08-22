import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_app/config/lang/models/language_typing_direction.dart';
import 'package:web_app/config/lang/models/supported_country_code.dart';
import 'package:web_app/config/lang/models/supported_language.dart';
import 'package:web_app/config/lang/models/supported_language_code.dart';
import 'package:web_app/config/lang/models/supported_locale_type.dart';
import 'package:web_app/models/serialization.dart';

/// Custom Locale for the app
class AppLocale implements Serialization<AppLocale> {
  /// constructor
  const AppLocale({
    required this.supportedLocaleType,
    required this.countryCode,
    required this.languageName,
    required this.flag,
    required this.languageTypingDirection,
    required this.supportLanguage,
    required this.supportedLanguageCode,
    required this.fontFamily,
  });

  /// get Locale object
  /// The first argument is the primary language [supportLanguage],
  /// the second is the region (also referred to as 'country') [countryCode].
  /// For example:
  /// ```dart
  /// Locale(supportedLanguageCode.name, countryCode?.name)
  /// const Locale swissFrench = Locale('fr', 'CH');
  /// ```
  Locale get locale => Locale(supportedLanguageCode.name, countryCode?.name);

  /// the language name in it's local
  /// ex: "العربية", "English", ""
  final String languageName;

  /// font family for specific language
  final String fontFamily;

  /// flag of the country if exist
  final String? flag;

  ///LTR Or Rtl
  final LanguageTypingDirection languageTypingDirection;

  /// supported language  in the app
  /// ex:  arabic - english
  final SupportedLanguage supportLanguage;

  /// ex: ar, en,
  final SupportedLanguageCode supportedLanguageCode;

  /// ex: US, EG,
  final SupportedCountryCode? countryCode;

  /// the language Type of SupportedLocaleType enum
  final SupportedLocaleType supportedLocaleType;

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'languageName': languageName,
      'fontFamily': fontFamily,
      'flag': flag,
      'languageTypingDirection': languageTypingDirection.name,
      'supportLanguage': supportLanguage.name,
      'supportedLanguageCode': supportedLanguageCode.name,
      'countryCode': countryCode!.name,
      'supportedLocaleType': supportedLocaleType.name,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  AppLocale fromJson(String source) {
    return fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  AppLocale fromMap(Map<String, dynamic> map) {
    return AppLocale(
      supportedLocaleType: SupportedLocaleType.values.firstWhere(
        (element) => element.name == map['supportedLocaleType'],
      ),
      supportLanguage: SupportedLanguage.values.firstWhere(
        (element) => element.name == map['supportLanguage'],
      ),
      languageName: (map['getLanguageName'] ?? '') as String,
      flag: (map['flag'] ?? '') as String,
      languageTypingDirection: LanguageTypingDirection.values.firstWhere(
        (element) => element.name == map['languageTypingDirection'],
      ),
      supportedLanguageCode: SupportedLanguageCode.values.firstWhere(
        (element) => element.name == map['supportedLanguageCode'],
      ),
      fontFamily: map['fontFamily'] as String,
      countryCode: SupportedCountryCode.values.firstWhere(
        (element) => element.name == map['supportedCountryCode'],
      ),
    );
  }
}

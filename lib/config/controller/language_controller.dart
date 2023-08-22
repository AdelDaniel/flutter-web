import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/config/lang/models/models.dart';
import 'package:web_app/config/lang/models/supported_locale_type.dart';

/// change the language of the app
class LanguageController extends GetxController {
  ///  LanguageController instance
  static LanguageController instance = Get.find<LanguageController>();

  final _appLocale = Rx<AppLocale>(AllAppLocales.englishUs);

  /// change the language of the app
  void changLanguage(SupportedLocaleType type) {
    if (type == SupportedLocaleType.arEg) {
      _appLocale.value = AllAppLocales.arabicEg;
    } else if (type == SupportedLocaleType.enUs) {
      _appLocale.value = AllAppLocales.englishUs;
    }
  }

  /// toggle Language form ar to en and vise verse
  void toggleLanguage() {
    if (_appLocale.value.supportedLocaleType ==
        AllAppLocales.arabicEg.supportedLocaleType) {
      _appLocale.value = AllAppLocales.englishUs;
    } else {
      _appLocale.value = AllAppLocales.arabicEg;
    }
    Get.updateLocale(locale);
  }

  /// get the Locale object. of the app
  Locale get locale => _appLocale.value.locale;

  /// the flag of the current country code
  String? get flag => _appLocale.value.flag;

  /// the language name
  String get otherLanguageName {
    if (_appLocale.value.supportedLocaleType == SupportedLocaleType.arEg) {
      return AllAppLocales.englishUs.languageName;
    } else {
      return AllAppLocales.arabicEg.languageName;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:web_app/config/lang/app_localizations.dart';
import 'package:web_app/constants/constants.dart';

/// Localizations Values
extension LocalizationsValues on BuildContext {
  AppLocalizations get _appLocalizations => AppLocalizations.of(this);
  String get _languageCode =>
      _appLocalizations.locale.languageCode.toLowerCase().trim();

  /// ex:
  /// use: context.translate()
  /// don't: AppLocalizations.of(this).translate()
  String Function(String key) get translate => _appLocalizations.translate;

  /// check if language is Arabic
  bool get isAr => _languageCode == AppStrings.arLanguageCode;

  /// check if language is English
  bool get isEn => _languageCode == AppStrings.enLanguageCode;
}

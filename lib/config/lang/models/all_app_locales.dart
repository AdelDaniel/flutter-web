import 'package:web_app/config/lang/models/models.dart';
import 'package:web_app/config/lang/models/supported_locale_type.dart';
import 'package:web_app/constants/constants.dart';

/// All Languages Supported in the app
abstract final class AllAppLocales {
  const AllAppLocales._();

  ///arabicLanguage
  static const AppLocale arabicEg = AppLocale(
    supportedLocaleType: SupportedLocaleType.arEg,
    countryCode: SupportedCountryCode.EG,
    languageName: AppStrings.arabicLanguageName,
    flag: '🇪🇬',
    languageTypingDirection: LanguageTypingDirection.rtl,
    supportLanguage: SupportedLanguage.arabic,
    supportedLanguageCode: SupportedLanguageCode.ar,
    fontFamily: AppStrings.notoSansArabic,
  );

  ///englishLanguage
  static const AppLocale englishUs = AppLocale(
    supportedLocaleType: SupportedLocaleType.enUs,
    countryCode: SupportedCountryCode.EG,
    languageName: AppStrings.englishLanguageName,
    flag: '🇺🇸',
    languageTypingDirection: LanguageTypingDirection.ltr,
    supportLanguage: SupportedLanguage.english,
    supportedLanguageCode: SupportedLanguageCode.en,
    fontFamily: AppStrings.notoSansArabic,
  );
}

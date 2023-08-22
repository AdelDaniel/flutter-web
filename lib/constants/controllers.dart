// ignore_for_file: public_member_api_docs

import 'package:web_app/config/controller/language_controller.dart';
import 'package:web_app/controllers/app_menu_controller.dart';

/// All The Controllers Used in the app
abstract final class Controllers {
  const Controllers._();

  static final AppMenuController appMenuController = AppMenuController.instance;
  static final LanguageController languageController =
      LanguageController.instance;
}

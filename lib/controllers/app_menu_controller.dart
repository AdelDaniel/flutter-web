import 'package:get/get.dart';
import 'package:web_app/models/side_menu_item_type.dart';

/// the menu bar controller
class AppMenuController extends GetxController {
  /// AppMenuController static instance
  static AppMenuController instance = Get.find<AppMenuController>();

  /// activateItem current selected (activate) menu item
  final _activateItem = Rx<SideMenuItemType>(SideMenuItemType.overview);
  final _hoverItem = Rx<SideMenuItemType?>(null);

  /// change current Active Menu Item
  set activateItem(SideMenuItemType sideMenuItemTypes) {
    _activateItem.value = sideMenuItemTypes;
  }

  /// get current activate SideMenuItemTypes
  SideMenuItemType get activateItem => _activateItem.value;

  /// call when the mouse hover on an item
  void onHover(SideMenuItemType sideMenuItemType) {
    if (!isActive(sideMenuItemType)) {
      _hoverItem.value = sideMenuItemType;
    }
  }

  /// check if SideMenuItemTypes isHovering
  bool isHovering(SideMenuItemType itemName) => _hoverItem.value == itemName;

  /// check if SideMenuItemTypes isActive
  bool isActive(SideMenuItemType itemName) => activateItem == itemName;
}

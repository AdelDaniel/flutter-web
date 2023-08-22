import 'package:flutter/material.dart';
import 'package:web_app/constants/screen_sizes.dart';

/// extension to get [_height] and [_width]
/// ex
/// ```
/// : context.width;
/// : MediaQuery.of(this).size.width
/// ```
extension SizeExtension on BuildContext {
  /// screen width
  double get _width => MediaQuery.of(this).size.width;

  /// screen height
  double get _height => MediaQuery.of(this).size.height;

  /// check if the isSmallScreen: width < ScreenSizes.mediumScreenSize
  bool get isSmallScreen {
    return _width < ScreenSizes.mediumScreenSize;
  }

  /// check if the isMediumScreen:
  /// - width >= ScreenSizes.mediumScreenSize
  /// - width < ScreenSizes.largeScreenSize
  bool get isMediumScreen {
    return _width >= ScreenSizes.mediumScreenSize &&
        _width < ScreenSizes.largeScreenSize;
  }

  /// check if the isLargeScreen: width > ScreenSizes.largeScreenSize
  bool get isLargeScreen {
    return _width > ScreenSizes.largeScreenSize;
  }

  /// check if the isCustomSize:
  /// - width <= ScreenSizes.customScreenSize &&
  /// - width >= ScreenSizes.mediumScreenSize;
  bool get isCustomSize {
    return _width <= ScreenSizes.customScreenSize &&
        _width >= ScreenSizes.mediumScreenSize;
  }
}

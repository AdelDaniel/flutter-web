import 'package:flutter/material.dart';
import 'package:web_app/constants/screen_size_type.dart';
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

  /// check if the isPhoneSize:
  /// width < [ScreenSizes.maxSmallScreenSize]
  bool get isPhoneSize {
    return _width < ScreenSizes.maxSmallScreenSize;
  }

  /// small screens are phones
  // bool get isPhone => isPhoneSize;

  /// check if the isTabletSize:
  /// - width >= [ScreenSizes.maxMediumScreenSize]
  /// - width < [ScreenSizes.maxLargeScreenSize]
  bool get isTabletSize {
    return _width >= ScreenSizes.maxSmallScreenSize &&
        _width < ScreenSizes.maxMediumScreenSize;
  }

  /// medium screens are tablets
  // bool get isTablet => isTabletSize;

  /// check if the isWebSize:
  /// - width >= [ScreenSizes.maxMediumScreenSize]
  /// - width < [ScreenSizes.maxLargeScreenSize]
  bool get isWebSize {
    return _width >= ScreenSizes.maxMediumScreenSize &&
        _width < ScreenSizes.maxLargeScreenSize;
  }

  /// custom Size is web
  // bool get isWeb => isWebSize;

  /// check if the isLargeSize:
  /// - width >= [ScreenSizes.maxLargeScreenSize] ;
  bool get isLargeSize {
    return _width >= ScreenSizes.maxLargeScreenSize;
  }

  ///
  ScreenSizeType get screenSizeType {
    if (isPhoneSize) {
      return ScreenSizeType.phone;
    } else if (isTabletSize) {
      return ScreenSizeType.tablet;
    } else if (isWebSize) {
      return ScreenSizeType.web;
    } else {
      return ScreenSizeType.large;
    }
  }
}

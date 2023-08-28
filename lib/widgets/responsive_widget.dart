import 'package:flutter/material.dart';
import 'package:web_app/constants/screen_sizes.dart';

class ResponsiveWidget extends StatelessWidget {
  /// constructor
  const ResponsiveWidget({
    required this.largeScreen,
    super.key,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
  });

  /// largeScreen
  final Widget largeScreen;

  /// mediumScreen
  final Widget? mediumScreen;

  /// smallScreen
  final Widget? smallScreen;

  /// the custom screen size is specific to this project
  final Widget? customScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        if (maxWidth < _maxSmallScreenSize) {
          return smallScreen ?? mediumScreen ?? largeScreen;
        } else if (maxWidth > _maxSmallScreenSize &&
            maxWidth < _maxMediumScreenSize) {
          return mediumScreen ?? smallScreen ?? largeScreen;
        } else if (maxWidth >= _maxMediumScreenSize &&
            maxWidth < _maxLargeScreenSize) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }

  static int get _maxSmallScreenSize => ScreenSizes.maxSmallScreenSize;
  static int get _maxMediumScreenSize => ScreenSizes.maxMediumScreenSize;
  static int get _maxLargeScreenSize => ScreenSizes.maxLargeScreenSize;
}

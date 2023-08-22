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

  ///largeScreen
  final Widget largeScreen;

  ///mediumScreen
  final Widget? mediumScreen;

  ///smallScreen
  final Widget? smallScreen;

  /// the custom screen size is specific to this project
  final Widget? customScreen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ScreenSizes.largeScreenSize) {
          return largeScreen;
        } else if (constraints.maxWidth < ScreenSizes.largeScreenSize &&
            constraints.maxWidth >= ScreenSizes.mediumScreenSize) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

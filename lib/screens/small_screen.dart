import 'package:flutter/material.dart';
import 'package:web_app/config/router/app_routing.dart';
import 'package:web_app/constants/constants.dart';

/// Small Screen For mobile
class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Controllers.localNavigationService.localNavigator;
  }
}

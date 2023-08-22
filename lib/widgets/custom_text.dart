// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// the custom text widget of the app
class CustomText extends StatelessWidget {
  /// CustomText Constructor
  const CustomText(
    this.text, {
    this.size,
    this.color,
    this.weight,
    super.key,
  });

  /// The text to display.
  final String text;

  final double? size;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}

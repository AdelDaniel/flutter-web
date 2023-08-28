import 'dart:io';

import 'package:flutter/material.dart';

/// move the widget up when mouser hover on it
class TranslateOnHover extends StatefulWidget {
  /// You can also pass the translation in here if you want to
  const TranslateOnHover({required this.child, super.key});
  final Widget child;

  @override
  State<TranslateOnHover> createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final _nonHoverTransform = Matrix4.identity()..translate(0);
  final _hoverTransform = Matrix4.identity()..translate(0, -10);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return widget.child;
    } else {
      return MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _hovering ? _hoverTransform : _nonHoverTransform,
          child: widget.child,
        ),
      );
    }
  }

  void _mouseEnter(bool hover) {
    setState(() => _hovering = hover);
  }
}

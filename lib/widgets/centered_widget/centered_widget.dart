import 'package:flutter/material.dart';

/// **Centered Widget**
/// Center The [child] Widget With Constrains
class CenteredWidget extends StatelessWidget {
  /// Creates an [CenteredWidget] with the given values.
  const CenteredWidget({required this.child, super.key});

  /// widget need to be centered
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 70),
      constraints: BoxConstraints(maxWidth: 1200),
      alignment: AlignmentDirectional.topCenter,
      child: child,
    );
  }
}

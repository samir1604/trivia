import 'dart:ui';

import 'package:flutter/material.dart';

/// Frosted glass effect
class FrostedGlass extends StatelessWidget {
  /// Constructor
  const FrostedGlass({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    this.radius = 10,
  });

  /// Container height
  final double height;

  /// Container width
  final double width;

  /// Border radius
  final double radius;

  /// Container child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(color: Colors.white.withOpacity(.13)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(.15),
                    Colors.white.withOpacity(.10),
                  ],
                ),
              ),
            ),
            Container(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

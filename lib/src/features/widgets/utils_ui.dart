import 'package:flutter/material.dart';

/// Get Circle Decoration
BoxDecoration getCircleDecoration() {
  return const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(255, 255, 255, 0),
        Color.fromRGBO(255, 255, 255, .5),
        Color.fromRGBO(255, 255, 255, 1),
      ],
      stops: [
        0,
        52,
        100,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

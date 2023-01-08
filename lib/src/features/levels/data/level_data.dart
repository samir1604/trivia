import 'package:flutter/material.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Data for every level button
final levelData = {
  0: {
    'image': 'assets/images/level1.png',
    'color': colorShade(Colors.blueAccent)[700],
    'text': 'Principiante',
  },
  1: {
    'image': 'assets/images/level2.png',
    'color': colorShade(Colors.pinkAccent)[700],
    'text': 'Intermedio',
  },
  2: {
    'image': 'assets/images/level3.png',
    'color': colorShade(Colors.orangeAccent)[700],
    'text': 'Experto',
  },
  3: {
    'image': 'assets/images/level4.png',
    'color': colorShade(Colors.greenAccent)[700],
    'text': 'Rambo',
  },
};

import 'dart:math';

import 'package:flutter/material.dart';

/* Light theme */

/// Light Colors
const Color kLightPrimary = Color(0xff303f9f);

/// Light Colors
const Color kLightPrimaryContainer = Color(0xffaeb9f4);

/// Light Colors
const Color kLightSecondary = Color(0xff512da8);

/// Light Colors
const Color kLightSecondaryContainer = Color(0xffe9ddff);

/// Light Colors
const Color kLightTertiary = Color(0xff311b92);

/// Light Colors
const Color kLightTertiaryContainer = Color(0xffd1c5ff);

/// Light Colors
const Color kLightAppBarColor = Color(0xffe9ddff);

/// Light Colors
const Color kLightError = Color(0xffb00020);

/* Dark theme */

/// Dark Colors
const Color kDarkPrimary = Color(0xff7986cb);

/// Dark Colors
const Color kDarkPrimaryContainer = Color(0xff283593);

/// Dark Colors
const Color kDarkSecondary = Color(0xff9575cd);

/// Dark Colors
const Color kDarkSecondaryContainer = Color(0xff502ca7);

/// Dark Colors
const Color kDarkTertiary = Color(0xff7e57c2);

/// Dark Colors
const Color kDarkTertiaryContainer = Color(0xff4433a4);

/// Dark Colors
const Color kDarkAppBarColor = Color(0xff502ca7);

/// Dark Colors
const Color kDarkError = Color(0xffcf6679);

/* Custom Colors */
/// Background color
const Color kBackgroundColor = Color(0xff323862);
/// Primary Color
const Color kPrimaryColor  = Color(0xff3e9fff);
/// Box background color
const Color kBoxBackgroundColor = Color(0xff383e6e);
/// Box blue background color
const Color kBlueBackgroundColor = Color(0xff3d9bf9);

/// Get material color
MaterialColor colorShade(Color color) {
  return MaterialColor(color.value, {
    50: _tintColor(color, 0.9),
    100: _tintColor(color, 0.8),
    200: _tintColor(color, 0.6),
    300: _tintColor(color, 0.4),
    400: _tintColor(color, 0.2),
    500: color,
    600: _shadeColor(color, 0.1),
    700: _shadeColor(color, 0.2),
    800: _shadeColor(color, 0.3),
    900: _shadeColor(color, 0.4),
  });
}

Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1,
    );

int _tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

int _shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1,
    );

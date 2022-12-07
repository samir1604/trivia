import 'package:flutter/material.dart';

/// Light Colors
const Color kLightPrimary = Color(0xff4e0029);
/// Light Colors
const Color kLightPrimaryContainer = Color(0xffbda5b1);
/// Light Colors
const Color kLightSecondary = Color(0xff00341a);
/// Light Colors
const Color kLightSecondaryContainer = Color(0xff8dc1a8);
/// Light Colors
const Color kLightTertiary = Color(0xff124c2f);
/// Light Colors
const Color kLightTertiaryContainer = Color(0xffa4d9bf);
/// Light Colors
const Color kLightAppBarColor = Color(0xff8dc1a8);
/// Light Colors
const Color kLightError = Color(0xffb00020);

/// Dark Colors
const Color kDarkPrimary = Color(0xff94667e);
/// Dark Colors
const Color kDarkPrimaryContainer = Color(0xff4e0029);
/// Dark Colors
const Color kDarkSecondary = Color(0xff6b9882);
/// Dark Colors
const Color kDarkSecondaryContainer = Color(0xff21614c);
/// Dark Colors
const Color kDarkTertiary = Color(0xff599b7b);
/// Dark Colors
const Color kDarkTertiaryContainer = Color(0xff1d5330);
/// Dark Colors
const Color kDarkAppBarColor = Color(0xff21614c);
/// Dark Colors
const Color kDarkError = Color(0xffcf6679);

Map<int, Color> _colorCodes = {
  50: const Color.fromRGBO(147, 205, 72, .1),
  100: const Color.fromRGBO(147, 205, 72, .2),
  200: const Color.fromRGBO(147, 205, 72, .3),
  300: const Color.fromRGBO(147, 205, 72, .4),
  400: const Color.fromRGBO(147, 205, 72, .5),
  500: const Color.fromRGBO(147, 205, 72, .6),
  600: const Color.fromRGBO(147, 205, 72, .7),
  700: const Color.fromRGBO(147, 205, 72, .8),
  800: const Color.fromRGBO(147, 205, 72, .9),
  900: const Color.fromRGBO(147, 205, 72, 1),
};

/// Get material color
MaterialColor colorShare(Color color) {
  return MaterialColor(color.value, _colorCodes);
}

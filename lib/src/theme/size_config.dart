import 'package:flutter/material.dart';

/// Screen size
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  /// Screen Width
  static double? screenWidth;
  /// Screen Height
  static double? screenHeight;
  /// Block size width
  static double? blockSizeHorizontal;
  /// Block size height
  static double? blockSizeVertical;

  /// Initialize
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}

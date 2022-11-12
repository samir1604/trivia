import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:trivia/src/routing/app_route.dart';

/// Main application class
class App extends StatelessWidget {
  /// Main app constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      routerDelegate: appRouter.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Trivia',
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff4e0029),
          primaryContainer: Color(0xffbda5b1),
          secondary: Color(0xff00341a),
          secondaryContainer: Color(0xff8dc1a8),
          tertiary: Color(0xff124c2f),
          tertiaryContainer: Color(0xffa4d9bf),
          appBarColor: Color(0xff8dc1a8),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff94667e),
          primaryContainer: Color(0xff4e0029),
          secondary: Color(0xff6b9882),
          secondaryContainer: Color(0xff21614c),
          tertiary: Color(0xff599b7b),
          tertiaryContainer: Color(0xff1d5330),
          appBarColor: Color(0xff21614c),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use the playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      themeMode: ThemeMode.dark,
    );
  }
}

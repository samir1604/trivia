import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:trivia/src/routes/app_route.dart';
import 'package:trivia/src/theme/app_style.dart';

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
          primary: kLightPrimary,
          primaryContainer: kLightPrimaryContainer,
          secondary: kLightSecondary,
          secondaryContainer: kLightSecondaryContainer,
          tertiary: kLightTertiary,
          tertiaryContainer: kLightTertiaryContainer,
          appBarColor: kLightAppBarColor,
          error: kLightError,
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
          primary: kDarkPrimary,
          primaryContainer: kDarkPrimaryContainer,
          secondary: kDarkSecondary,
          secondaryContainer: kDarkSecondaryContainer,
          tertiary: kDarkTertiary,
          tertiaryContainer: kDarkTertiaryContainer,
          appBarColor: kDarkAppBarColor,
          error: kDarkError,
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

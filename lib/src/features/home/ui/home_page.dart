import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/theme/size_config.dart';

import 'package:trivia/src/features/home/i18n/home_i18n.dart';
import 'package:trivia/src/features/home/route/route_navigation.dart';

/// Application Home Page
class HomePage extends StatelessWidget {
  /// Application Home Page Constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ColoredBox(
      color: Theme.of(context).backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                          color: Theme.of(context).backgroundColor,
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            'assets/images/home_logo.jpg',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    welcomeTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    appTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .3,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * .15,
                    ),
                    child: ElevatedButton(
                      onPressed: () => context.go(levelsNavigation),
                      child: Text(
                        startButtonText,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

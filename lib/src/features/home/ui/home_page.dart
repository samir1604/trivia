import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/home/i18n/home_i18n.dart';
import 'package:trivia/src/features/home/route/data_navigation.dart';
import 'package:trivia/src/features/home/ui/widgets/level_home.dart';
import 'package:trivia/src/features/home/ui/widgets/podium_home.dart';
import 'package:trivia/src/features/home/ui/widgets/trivia_home.dart';
import 'package:trivia/src/features/home/ui/widgets/welcome_home.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Application Home Page
class HomePage extends StatelessWidget {
  /// Application Home Page Constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WelcomeHome(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TriviaHome(),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff383e6e),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        LevelHome(
                          imagePath: 'assets/images/level1.png',
                          levelImage: 'assets/images/one.png',
                        ),
                        LevelHome(
                          imagePath: 'assets/images/level2.png',
                          levelImage: 'assets/images/two.png',
                        ),
                        LevelHome(
                          imagePath: 'assets/images/level3.png',
                          levelImage: 'assets/images/three.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const PodiumHome(),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () => context.go(levelsNavigation),
                child: Text(
                  startButtonText,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),

      ),
    );
  }
}



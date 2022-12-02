import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/levels/route/data_navigation.dart';
import 'package:trivia/src/features/levels/ui/widgets/level_button.dart';

/// Levels Page
class LevelsPage extends StatelessWidget {
  /// Level Page Constructors
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                children: <Widget>[
                  LevelButton(
                    title: 'Nivel 1',
                    image: Image.asset('assets/images/level1.png'),
                    onTap: () => context.goNamed(
                      questionNavigation,
                      queryParams: levelOne,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  LevelButton(
                    title: 'Nivel 2',
                    image: Image.asset('assets/images/level2.png'),
                    onTap: () => context.goNamed(
                      questionNavigation,
                      queryParams: levelTwo,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  LevelButton(
                    title: 'Nivel 3',
                    image: Image.asset('assets/images/level3.png'),
                    onTap: () => context.goNamed(
                      questionNavigation,
                      queryParams: levelThree,
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

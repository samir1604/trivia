import 'package:flutter/material.dart';
import 'package:trivia/src/features/Widgets/trivia_appbar.dart';
import 'package:trivia/src/features/levels/ui/widgets/levels_buttons.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Levels Page
class LevelsPage extends StatelessWidget {
  /// Level Page Constructors
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: getTriviaAppBar(
        context,
        title: 'Empecemos',
        leading: const Icon(Icons.school_sharp),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Seleccione los niveles que se van habilitando',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: SizeConfig.screenHeight! * .1),
            const Expanded(
              child: LevelsButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

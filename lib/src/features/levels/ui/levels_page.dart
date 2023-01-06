import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/Widgets/trivia_appbar.dart';
import 'package:trivia/src/features/levels/route/data_navigation.dart';
import 'package:trivia/src/features/levels/ui/widgets/level_button.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Levels Page
class LevelsPage extends StatelessWidget {
  /// Level Page Constructors
  LevelsPage({super.key});

  final _imageUrl = {
    0: {'assets/images/level1.png'},
    1: {'assets/images/level2.png'},
    2: {'assets/images/level3.png'},
    3: {'assets/images/level4.png'},
  };

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Seleccione los niveles que se van habilitando',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: SizeConfig.screenHeight! * .15),
              Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    final title = 'Nivel ${index + 1}';
                    final imagePath = _imageUrl[index]?.single;
                    final level = levelsData[index];
                    return Column(
                      children: [
                        if (index != 3)
                          GestureDetector(
                            onTap: () => context.go(
                              questionNavigation,
                              extra: level,
                            ),
                            child: LevelButton(
                              title: title,
                              imagePath: imagePath!,
                            ),
                          )
                        else
                          LevelButton(
                            imagePath: imagePath!,
                            isClickableButton: false,
                          ),
                      ],
                    );
                  },
                ),
              ),
              ElevatedButton(
                child: Text('test'),
                onPressed: () => context.go('/levels/winner'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

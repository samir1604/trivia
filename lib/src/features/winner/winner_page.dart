import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/Widgets/trivia_appbar.dart';
import 'package:trivia/src/features/Widgets/utils_ui.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Winner page
class WinnerPage extends StatelessWidget {
  /// Constructor
  const WinnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: getTriviaAppBar(
          context,
          title: 'Ganador',
          leading: const Icon(Icons.wine_bar_sharp),
        ),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Opacity(
                  opacity: .1,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: getCircleDecoration(),
                  ),
                ),
              ),
              Positioned(
                top: SizeConfig.screenHeight! * .05,
                right: -30,
                child: Opacity(
                  opacity: .1,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: getCircleDecoration(),
                  ),
                ),
              ),
              Positioned(
                top: SizeConfig.screenHeight! * .35,
                left: -20,
                child: Opacity(
                  opacity: .08,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: getCircleDecoration(),
                  ),
                ),
              ),
              Positioned(
                top: SizeConfig.screenHeight! * .35,
                right: 25,
                child: Opacity(
                  opacity: .08,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: getCircleDecoration(),
                  ),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 20,
                child: Opacity(
                  opacity: .1,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: getCircleDecoration(),
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                right: -20,
                child: Opacity(
                  opacity: .2,
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: getCircleDecoration(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    CircleAvatar(
                      backgroundColor: Colors.black26,
                      radius: 108,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 100,
                        child: Image.asset(
                          'assets/images/winner_cup.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Center(
                      child: Text(
                        'Felicidades, eres un ganador',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Text(
                        'Has terminado el primer nivel',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Text(
                        'Tienes un nuevo nivel desbloqueado',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                    ElevatedButton(
                      onPressed: () => context.pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBlueBackgroundColor,
                      ),
                      child: const Text('Aceptar'),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

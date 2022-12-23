import 'package:flutter/material.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Podium home
class PodiumHome extends StatelessWidget {
  /// Constructor
  const PodiumHome({
    super.key,
    bool active = false,
  }) : _active = active;

  final bool _active;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: SizeConfig.screenHeight! * .15,
              decoration: BoxDecoration(
                color: kBlueBackgroundColor,
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    _active ? Colors.transparent : Colors.grey,
                    BlendMode.saturation,
                  ),
                  fit: BoxFit.cover,
                  image: const AssetImage(
                    'assets/images/podium.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              left: -10,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color.fromRGBO(255, 255, 255, .5),
                      Color.fromRGBO(255, 255, 255, 1),
                    ],
                    stops: [
                      0,
                      52,
                      100,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -10,
              top: -10,
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, .1),
                      Color.fromRGBO(255, 255, 255, .55),
                      Color.fromRGBO(255, 255, 255, 1),
                    ],
                    stops: [
                      0,
                      60,
                      100,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -5,
              bottom: -10,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color.fromRGBO(255, 255, 255, .8),
                      Color.fromRGBO(255, 255, 255, 1),
                    ],
                    stops: [
                      0,
                      52,
                      100,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: -10,
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color.fromRGBO(255, 255, 255, .5),
                      Color.fromRGBO(255, 255, 255, 1),
                    ],
                    stops: [
                      0,
                      52,
                      100,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

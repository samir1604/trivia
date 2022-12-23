import 'package:flutter/material.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Trivia home
class TriviaHome extends StatelessWidget {
  /// Constructor
  const TriviaHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: kBlueBackgroundColor,
            child: Image.asset(
              'assets/images/trivia_brain.png',
            ),
          ),
          Positioned(
            top: 0,
            left: -20,
            child: Container(
              height: 60,
              width: 60,
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
            bottom: -10,
            right: -10,
            child: Container(
              height: 65,
              width: 65,
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
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 50,
            bottom: -25,
            child: Container(
              height: 80,
              width: 80,
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
            top: -20,
            right: 70,
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
          )
        ],
      ),
    );
  }
}
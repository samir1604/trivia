import 'package:flutter/material.dart';
import 'package:trivia/src/features/home/i18n/home_i18n.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Welcome widget
class WelcomeHome extends StatelessWidget {
  /// Constructor
  const WelcomeHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight! * .30,
      decoration: const BoxDecoration(
        color: Color(0xff383e6e),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kBackgroundColor,
            ),
            child: Image.asset(
              'assets/images/logo.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            welcomeTitle,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            appTitle,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

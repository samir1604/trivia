import 'package:flutter/material.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Button for levels
class LevelButton extends StatelessWidget {
  /// Constructor
  const LevelButton({super.key, required this.title, required this.image});

  /// Button text
  final String title;

  /// Button image
  final Widget image;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: 120,
        maxWidth: SizeConfig.screenWidth! * .75,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Positioned(
              top: 50,
              left: 0,
              child: Container(
                height: constraints.maxHeight * .5,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.button?.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 9,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 5,
              child: SizedBox(
                height: constraints.maxHeight * .7,
                width: constraints.maxWidth * .4,
                child: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

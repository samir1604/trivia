import 'package:flutter/material.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

/// Level home
class LevelHome extends StatelessWidget {
  /// Constructor
  const LevelHome({
    super.key,
    required this.imagePath,
    required this.levelImage,
    bool active = false,
  }) : _active = active;

  /// Path to the image to show
  final String imagePath;

  /// Level name
  final String levelImage;

  final bool _active;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.screenWidth! * .2,
      height: 100,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                _active ? Colors.transparent : Colors.grey,
                BlendMode.saturation,
              ),
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffffecc8),
                ),
                child: Image.asset(
                  imagePath,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(levelImage, height: SizeConfig.screenWidth! * 0.05),
        ],
      ),
    );
  }
}

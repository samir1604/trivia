import 'package:flutter/material.dart';

/// Button for levels
class LevelButton extends StatelessWidget {
  /// Constructor
  const LevelButton({
    super.key,
    required this.imagePath,
    this.title = '',
    this.isClickableButton = true,
  });

  /// Set true is button is Clickable, is true by default
  final bool isClickableButton;

  /// Title of the button
  final String title;

  /// Path of the button image
  final String imagePath;

  BoxDecoration _getBoxLevelDecoration(bool isActionButton) {
    if (isActionButton) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(1, 1),
          )
        ],
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 62, 90],
          colors: [
            Color(0xff3d9bf9),
            Color(0xff517c94),
            Color(0xff98abb7),
            //Color(0xff6043a2),
            //Color(0xff6b589b),
          ],
        ),
      );
    }
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 110,
            height: 110,
            padding: const EdgeInsets.all(10),
            decoration: _getBoxLevelDecoration(isClickableButton),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -25,
            child: Image.asset(
              imagePath,
              width: 10,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Text(
              title,
              style: Theme.of(context).textTheme.button,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

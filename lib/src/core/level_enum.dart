import 'package:trivia/src/core/enums.dart';

/// Enums for levels
class Level extends SmartEnum<int> {
  /// Constructor
  const Level(
    super.value, {
    required this.jsonData,
    this.leadingImage,
  });

  /// Path for leading image
  final String? leadingImage;

  /// Json data path
  final String jsonData;

  /// First level data
  static const Level first = Level(
    1,
    leadingImage: 'assets/images/leading_image_1.png',
      jsonData: 'assets/data/mock_nivel_1.json'
    //jsonData: 'assets/data/nivel_1.json',
  );

  /// Second level data
  static const Level second = Level(
    2,
    leadingImage: 'assets/images/leading_image_1.png',
    jsonData: 'assets/data/nivel_1.json',
  );

  /// Third level data
  static const Level third = Level(
    3,
    leadingImage: 'assets/images/leading_image_1.png',
    jsonData: 'assets/data/nivel_1.json',
  );

  /// Four level data
  static const Level four = Level(
    4,
    leadingImage: 'assets/images/leading_image_1.png',
    jsonData: 'assets/data/nivel_1.json',
  );
}

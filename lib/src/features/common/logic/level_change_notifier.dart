import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia/src/core/level_enum.dart';

/// Level One Shared Preference Key
const levelOneKey = 'levelOne';
/// Level Two Shared Preference Key
const levelTwoKey = 'levelTwo';
/// Level Three Shared Preference Key
const levelThreeKey = 'levelThree';
/// Level Four Shared Preference Key
const levelFourKey = 'levelFour';

/// Level change notifier listener
class LevelChangeNotifier with ChangeNotifier {
  /// Constructor
  LevelChangeNotifier(this._preferences) {
    _refreshLevelState();
  }

  final SharedPreferences _preferences;

  late bool _levelOne;
  late bool _levelTwo;
  late bool _levelThree;
  late bool _levelFour;

  /// Get is level one is completed
  bool get isLevelOneCompleted => _levelOne;
  /// Get is level two is completed
  bool get isLevelTwoCompleted => _levelTwo;
  /// Get is level three is completed
  bool get isLevelThreeCompleted => _levelThree;
  /// Get is level four is completed
  bool get isLevelFourCompleted => _levelFour;

  /// Change level state
  void changeLeveState(Level level) {
    switch (level.value) {
      case 1:
        _levelOne = true;
        _preferences.setBool(levelOneKey, _levelOne);
        break;
      case 2:
        _levelTwo = true;
        _preferences.setBool(levelTwoKey, _levelTwo);
        break;
      case 3:
        _levelThree = true;
        _preferences.setBool(levelThreeKey, _levelThree);
        break;
      case 4:
        _levelFour = true;
        _preferences.setBool(levelFourKey, _levelFour);
        break;
      default:
        throw Exception('Argument range exception');
    }
    notifyListeners();
  }

  void _refreshLevelState() {
    _levelOne = _preferences.getBool(levelOneKey) ?? false;
    _levelTwo = _preferences.getBool(levelTwoKey) ?? false;
    _levelThree = _preferences.getBool(levelThreeKey) ?? false;
    _levelFour = _preferences.getBool(levelFourKey) ?? false;
    notifyListeners();
  }
}

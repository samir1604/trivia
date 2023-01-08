import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia/src/features/common/logic/level_change_notifier.dart';

/// Shared Preference Provider
final preferenceProvider = ChangeNotifierProvider<LevelChangeNotifier>((
  ref,
) {
  final pref = ref.watch(_sharedPreference).value;
  return LevelChangeNotifier(pref);
});

final _sharedPreference =
    FutureProvider((ref) => SharedPreferences.getInstance());

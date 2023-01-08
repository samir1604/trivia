import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia/src/features/common/logic/level_change_notifier.dart';
import 'package:trivia/src/features/common/logic/shared_preference_provider.dart';
import 'package:trivia/src/features/levels/data/level_data.dart';
import 'package:trivia/src/features/levels/route/data_navigation.dart';
import 'package:trivia/src/features/levels/ui/widgets/level_tile.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Levels button list
class LevelsButtons extends ConsumerWidget {
  ///Constructor
  const LevelsButtons({
    super.key,
  });

  /*
  Color _getFilterColor(int index, LevelChangeNotifier notifier) {
    switch (index) {
      case 0:
        return Colors.transparent;
      case 1:
        return notifier.isLevelOneCompleted ? Colors.transparent : Colors.grey;
      case 2:
        return notifier.isLevelTwoCompleted ? Colors.transparent : Colors.grey;
      case 3:
        return notifier.isLevelThreeCompleted
            ? Colors.transparent
            : Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Color _getBackgroundTileColor(
    int index,
    LevelChangeNotifier notifier,
    Color tileColor,
  ) {
    switch (index) {
      case 0:
        return tileColor;
      case 1:
        return notifier.isLevelOneCompleted ? tileColor : Colors.grey;
      case 2:
        return notifier.isLevelTwoCompleted ? tileColor : Colors.grey;
      case 3:
        return notifier.isLevelThreeCompleted ? tileColor : Colors.grey;
      default:
        return Colors.grey;
    }
  }

  void _getLevelTap(BuildContext context, int index,
      LevelChangeNotifier notifier,) {
    switch (index) {
      case 0:
        context.go(
          questionNavigation,
          extra: levelsData[index],
        );
        break;
      case 1:
        if (notifier.isLevelOneCompleted) {
          context.go(
            questionNavigation,
            extra: levelsData[index],
          );
        }
        break;
      case 2:
        if(notifier.isLevelTwoCompleted){
          context.go(
            questionNavigation,
            extra: levelsData[index],
          );
        }
        break;
      case 3:
        if(notifier.isLevelThreeCompleted) {
          context.go(
            questionNavigation,
            extra: levelsData[index],
          );
        }
        break;
    }
  }
  */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(preferenceProvider);

    /*
    Future<void>.delayed(Duration.zero).then((value) async {
      final shared = await SharedPreferences.getInstance();
      await shared.setBool('levelOne', false);
    });

     */


    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemCount: levelData.length,
      itemBuilder: (context, index) {
        var isEnabled = false;

        switch(index) {
          case 0:
            isEnabled = true;
            break;
          case 1:
            if(notifier.isLevelOneCompleted) {
              isEnabled = true;
            }
            break;
          case 2:
            if(notifier.isLevelTwoCompleted) {
              isEnabled = true;
            }
            break;
          case 3:
            if(notifier.isLevelThreeCompleted) {
              isEnabled = true;
            }
            break;
          default:
            isEnabled = false;
        }
        return LevelTile(index: index, isEnabled: isEnabled);
      },
    );
  }
}

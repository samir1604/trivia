import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/levels/data/level_data.dart';
import 'package:trivia/src/features/levels/route/data_navigation.dart';

/// Level Tile Widget
class LevelTile extends StatelessWidget {
  /// Constructor
  const LevelTile({super.key, required this.index, required this.isEnabled});

  /// Tile index in tiles
  final int index;

  /// Is tile enable
  final bool isEnabled;

  void _onTap(BuildContext context) {
    if (isEnabled) {
      context.go(
        questionNavigation,
        extra: levelsData[index],
      );
    }
  }

  Color _getFilterColor() {
    if(index == 0 || isEnabled) {
      return Colors.transparent;
    }
    return Colors.grey;
  }

  Color _getTileBackgroundColor() {
    if (index == 0 || isEnabled) {
      return levelData[index]!['color']! as Color;
    }

    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          _getFilterColor(),
          BlendMode.saturation,
        ),
        child: ListTile(
          visualDensity: const VisualDensity(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          tileColor: _getTileBackgroundColor(),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black26,
            child: CircleAvatar(
              radius: 28,
              foregroundImage: AssetImage(
                levelData[index]!['image']! as String,
              ),
            ),
          ),
          title: Text(
            'Inmunólogo',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            levelData[index]!['text']! as String,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ),
    );
  }
}

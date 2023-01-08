import 'package:flutter/material.dart';
import 'package:trivia/src/core/level_enum.dart';
import 'package:trivia/src/features/Widgets/trivia_appbar.dart';
import 'package:trivia/src/features/question/ui/widgets/current_question.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Question Page
class QuestionPage extends StatelessWidget {
  /// Constructor
  const QuestionPage({
    super.key,
    required this.level,
  });

  /// Path to level file
  final Level level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: getTriviaAppBar(
        context,
        title: 'Nivel',
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            level.leadingImage!,
            height: 30,
            width: 30,
            opacity: const AlwaysStoppedAnimation(.8),
          ),
        ),
      ),
      body: CurrentQuestion(
        level: level,
      ),
    );
  }
}

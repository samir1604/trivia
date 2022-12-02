import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/src/features/question/logic/question_provider.dart';

/// Question Page
class QuestionPage extends StatelessWidget {
  /// Constructor
  const QuestionPage({super.key, this.levelPath});

  /// Path to level file
  final String? levelPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CurrentQuestion(),
    );
  }
}

class CurrentQuestion extends ConsumerStatefulWidget {
  const CurrentQuestion({super.key});

  @override
  ConsumerState createState() => _CurrentQuestionState();
}

class _CurrentQuestionState extends ConsumerState<CurrentQuestion> {
  bool init = true;

  @override
  Future<void> didChangeDependencies() async {
    await Future(() {
      if (init) {
        ref
            .read(questionNotifierProvider.notifier)
            .loadList('assets/data/nivel_1.json');
        init = false;
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final question = ref.watch(questionNotifierProvider);
    return question.when(
      initial: () => const Text('iniciando'),
      loading: () => const CircularProgressIndicator(),
      data: (data) => Text(data.description),
      error: (error) => Text(error!),
    );
  }
}

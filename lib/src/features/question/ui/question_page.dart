import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/src/features/question/logic/answer_provider.dart';
import 'package:trivia/src/features/question/logic/question_provider.dart';
import 'package:trivia/src/features/question/ui/widgets/answer_button.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Question Page
class QuestionPage extends StatelessWidget {
  /// Constructor
  const QuestionPage({super.key, this.levelPath});

  /// Path to level file
  final String? levelPath;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CurrentQuestion(),
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
    final data = ref.watch(questionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nivel'),
        leading: Image.asset(
          'assets/images/first_32.png',
          color: Colors.pink[50],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.pop(),
          ),
        ],
      ),
      body: data.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Center(
                  child: Text('Pregunta ${data.position + 1} / ${data.length}'),
                ),
                Center(
                  child: Text(data.question.description),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.question.answers.length,
                  itemBuilder: (context, index) =>
                      AnswerButton(answer: data.question.answers[index]),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(answerStateProvider.notifier).state = null;
                    ref.read(questionNotifierProvider.notifier).getNext();
                  },
                  child: const Text('Next'),
                )
              ],
            ),
          );
        },
        error: (error) => Text(error!),
      ),
    );
  }
}

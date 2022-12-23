import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/src/features/Widgets/frosted_glass.dart';
import 'package:trivia/src/features/question/logic/answer_provider.dart';
import 'package:trivia/src/features/question/logic/question_provider.dart';
import 'package:trivia/src/features/question/ui/widgets/answer_button.dart';
import 'package:trivia/src/features/question/utils/utils.dart';

/// Show Current Question
class CurrentQuestion extends ConsumerStatefulWidget {
  /// Constructor
  const CurrentQuestion({
    super.key,
    required this.jsonData,
  });

  /// path json data
  final String jsonData;

  @override
  ConsumerState createState() => _CurrentQuestionState();
}

class _CurrentQuestionState extends ConsumerState<CurrentQuestion> {
  bool init = true;

  @override
  Future<void> didChangeDependencies() async {
    await Future(() {
      if (init) {
        ref.read(questionNotifierProvider.notifier).loadList(widget.jsonData);
        init = false;
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(questionNotifierProvider);

    return data.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 25),
              FrostedGlass(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Pregunta ${data.position + 1} / ${data.length}',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FrostedGlass(
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 10,
                  ),
                  child: Text(
                    data.question.description,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.question.answers.length,
                itemBuilder: (context, index) => AnswerButton(
                  letter: indexToLetter[index] ?? '',
                  answer: data.question.answers[index],
                ),
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
    );
  }
}

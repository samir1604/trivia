import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';
import 'package:trivia/src/features/Widgets/frosted_glass.dart';
import 'package:trivia/src/features/Widgets/trivia_timer.dart';
import 'package:trivia/src/features/question/logic/answer_provider.dart';
import 'package:trivia/src/features/question/logic/question_provider.dart';
import 'package:trivia/src/features/question/ui/widgets/answer_button.dart';
import 'package:trivia/src/features/question/utils/utils.dart';
import 'package:trivia/src/theme/app_style.dart';
import 'package:trivia/src/theme/size_config.dart';

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
  final timerKey = GlobalKey<TriviaTimerState>();

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

  void showMessage({
    required bool isCorrect,
    required String description,
    void Function(bool)? callback,
  }) {
    QuickAlert.show(
      context: context,
      type: isCorrect ? QuickAlertType.success : QuickAlertType.error,
      text: description,
      title: isCorrect ? 'Correcto' : 'Incorrecto',
      barrierDismissible: false,
      confirmBtnText: 'Aceptar',
      onConfirmBtnTap: () {
        if (callback != null) {
          callback(isCorrect);
        }
      },
    );
  }

  void onCheckPressed(
    BuildContext context, {
    int? selectedId,
    required int answerId,
    required String correctAnswer,
  }) {
    timerKey.currentState!.cancelTimer();

    showMessage(
      isCorrect: selectedId == answerId,
      description: 'Respuesta correcta: $correctAnswer',
      callback: (isCorrect) {
        if (isCorrect) {
          Navigator.pop(context);
          ref.read(answerStateProvider.notifier).state = null;
          ref.read(questionNotifierProvider.notifier).getNext();
          timerKey.currentState!.initTimer();
        } else {
          context.pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final data = ref.watch(questionNotifierProvider);
    final selected = ref.watch(answerStateProvider);

    return data.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        return SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                TriviaTimer(
                  key: timerKey,
                  initialSeconds: 30,
                  onFinished: () => showMessage(
                    isCorrect: false,
                    description: 'Se termino el tiempo',
                    callback: (_) => context.pop(),
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    text: 'Pregunta ${data.position + 1}',
                    style: Theme.of(context).textTheme.headline4,
                    children: [
                      TextSpan(
                          text: '/ ${data.length}',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 15),
                FrostedGlass(
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      data.question.description,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(),
                const SizedBox(height: 15),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: data.question.answers.length,
                  itemBuilder: (context, index) => AnswerButton(
                    letter: indexToLetter[index] ?? '',
                    answer: data.question.answers[index],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 5),
                ),
                const Expanded(child: SizedBox.shrink()),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    final correctAnswer = data.question.answers
                        .where((element) => element.isCorrect)
                        .first;

                    onCheckPressed(
                      context,
                      selectedId: selected?.id,
                      answerId: correctAnswer.id,
                      correctAnswer: correctAnswer.description,
                    );
                  },
                  child: const Text('Verificar'),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
      error: (error) => Text(error!),
    );
  }
}

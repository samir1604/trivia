import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/src/domain/entities/answer.dart';
import 'package:trivia/src/features/question/logic/answer_provider.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Custom Answer button
class AnswerButton extends ConsumerWidget {
  /// Constructor
  const AnswerButton({
    required this.answer,
    super.key,
  });

  /// Answer value
  final Answer answer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(answerStateProvider);

    return ElevatedButton(
      onPressed: () {
        ref.read(answerStateProvider.notifier).state = answer;
      },
      child: Row(
        children: [
          Text(answer.description),
          if(selected?.id == answer.id)
            DecoratedBox(
              decoration: BoxDecoration(
                color: kDarkPrimaryContainer,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: kLightPrimaryContainer,
                  width: 3,

                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: const Icon(Icons.check, color: Colors.grey,),
              ),
            )
        ],
      ),
    );
  }
}

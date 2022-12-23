import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/src/domain/entities/answer.dart';
import 'package:trivia/src/features/question/logic/answer_provider.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Custom Answer button
class AnswerButton extends ConsumerWidget {
  /// Constructor
  const AnswerButton({
    required this.letter,
    required this.answer,
    super.key,
  });

  /// Letter identifier
  final String letter;

  /// Answer value
  final Answer answer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(answerStateProvider);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color?>(
          selected?.id == answer.id ? kDarkPrimaryContainer : null,
        ),
      ),
      onPressed: () {
        ref.read(answerStateProvider.notifier).state = answer;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selected?.id != answer.id)
            DecoratedBox(
              decoration: BoxDecoration(
                color: kDarkPrimaryContainer,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const <BoxShadow>[
                  BoxShadow(blurRadius: 2, offset: Offset(1.2,1.2))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Text(
                  letter,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          else
            const SizedBox(width: 30),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              answer.description,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          if (selected?.id == answer.id)
            DecoratedBox(
              decoration: BoxDecoration(
                color: kDarkPrimary,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: colorShade(kDarkPrimaryContainer)[400]!,
                  width: 3,
                ),
                boxShadow: const <BoxShadow>[
                  BoxShadow(blurRadius: 4, offset: Offset(.8,.8))
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.check,
                  color: kDarkPrimaryContainer,
                ),
              ),
            )
        ],
      ),
    );
  }
}

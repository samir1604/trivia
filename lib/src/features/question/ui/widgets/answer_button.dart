import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/src/domain/entities/answer.dart';
import 'package:trivia/src/features/question/logic/answer_provider.dart';
import 'package:trivia/src/theme/app_style.dart';

/// Custom Answer button
class AnswerButton extends StatefulWidget {
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
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late double scale;

  @override
  void initState() {
    super.initState();
    scale = 0;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: .05,
      reverseDuration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scale = 1 + animationController.value;

    return Transform.scale(
      scale: scale,
      child: Consumer(
        builder: (context, ref, child) {
          final selected = ref.watch(answerStateProvider);

          if (selected?.id != widget.answer.id) {
            animationController.reverse();
          } else {
            animationController.forward();
          }

          return ElevatedButton.icon(
            icon: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffd4d69), Color(0xffb66ef8)],
                ),
              ),
              child: Text(
                widget.letter.trim(),
                style: Theme.of(context).textTheme.button,
              ),
            ),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    widget.answer.description,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                Icon(
                  selected?.id == widget.answer.id
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  size: 20,
                  color: kPrimaryColor,
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              alignment: Alignment.centerLeft,
              backgroundColor: kBoxBackgroundColor,
              elevation: 2,
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: kBlueBackgroundColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              ref.read(answerStateProvider.notifier).state = widget.answer;
            },
          );
        },
      ),
    );
  }
}

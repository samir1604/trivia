import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia/src/domain/entities/question.dart';

part 'question_state.freezed.dart';

/// Question state for riverpod
@freezed
abstract class QuestionState with _$QuestionState {

  /// Initial state
  const factory QuestionState.initial() = _QuestionStateInitial;

  /// Loading state
  const factory QuestionState.loading() = _QuestionStateLoading;

  /// Received data state
  const factory QuestionState.data({required List<Question> questionList}) =
      _QuestionStateData;

  /// Error state
  const factory QuestionState.error([String? error]) = _QuestionStateError;
}

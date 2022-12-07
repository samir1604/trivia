import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia/src/domain/entities/question.dart';

part 'question_data.freezed.dart';

/// Class to transfer data from question state notifier
/// to ui
@freezed
abstract class QuestionData with _$QuestionData {
  /// Factory constructor
  const factory QuestionData({
    required int position,
    required int length,
    required Question question,
  }) = _QuestionData;

  /// Factory method to create new Question data
  factory QuestionData.create(int position, int length, Question question) =>
      QuestionData(position: position, length: length, question: question);
}






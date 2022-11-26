import 'package:collection/collection.dart';
import 'package:trivia/src/domain/contracts/entity.dart';
import 'package:trivia/src/domain/entities/answer.dart';

/// Question Entity
class Question extends Entity {
  /// Constructor
  const Question({
    required super.id,
    required this.description,
    required this.answers,
  });

  /// Create entity from json
  factory Question.fromJson(int id, Map<String, dynamic> json) => Question(
        id: id,
        description: json['question'] as String,
        answers: List<Answer>.from(
          (json['answers'] as List)
              .mapIndexed<Answer>(
                (index, e) => Answer(
                  id: index + 1,
                  description: (e as Map<String, dynamic>)['answer'] as String,
                  isCorrect: e['value'] as bool,
                ),
              )
              .toList(),
        ),
      );

  /// Entity description
  final String description;

  /// Answer list
  final List<Answer> answers;

  /// Create entity copy
  Question copyWith({
    String? description,
    List<Answer>? answers,
  }) =>
      Question(
        id: id,
        description: description ?? this.description,
        answers: answers ?? this.answers,
      );

  /// Convert class to json value
  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'answers': List<dynamic>.from(answers.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [id, description];
}

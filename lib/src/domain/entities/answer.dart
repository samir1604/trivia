import 'package:trivia/src/domain/contracts/entity.dart';

/// Answer Entity
class Answer extends Entity {
  /// Constructor
  const Answer({
    required super.id,
    required this.description,
    required this.isCorrect,
  });

  /// Create entity from json
  factory Answer.fromJson(int id, Map<String, dynamic> json) => Answer(
        id: id,
        description: json['answer'] as String,
        isCorrect: json['value'] as bool,
      );

  /// Entity description
  final String description;

  /// Entity value
  final bool isCorrect;

  /// Make entity copy
  Answer copyWith({
    String? description,
    bool? isCorrect,
  }) =>
      Answer(
        id: super.id,
        description: description ?? this.description,
        isCorrect: isCorrect ?? this.isCorrect,
      );

  /// Convert entity to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'isCorrect': isCorrect,
      };

  @override
  List<Object?> get props => [id, description, isCorrect];
}

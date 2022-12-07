import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/src/domain/entities/answer.dart';

/// Provider for selected answer
final answerStateProvider = StateProvider<Answer?>((ref) => null);

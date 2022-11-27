import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/src/data/repositories/local_repository.dart';
import 'package:trivia/src/data/sources/local_consumer.dart';
import 'package:trivia/src/domain/entities/question.dart';
import 'package:trivia/src/domain/usecases/get_question_list.dart';
import 'package:trivia/src/features/question/logic/question_state.dart';

part 'question_state_notifier.dart';

/// Question state notifier logic
final questionNotifierProvider =
    StateNotifierProvider<QuestionNotifier, QuestionState>(
  (ref) => QuestionNotifier(getQuestionList: ref.watch(_useCaseProvider)),
);

final _useCaseProvider = Provider(
  (ref) => GetQuestionList(ref.read(_repositoryProvider)),
);

final _repositoryProvider = Provider(
  (ref) => LocalRepositoryImpl(ref.read(_consumerProvider)),
);

final _consumerProvider = Provider((ref) => LocalConsumer());

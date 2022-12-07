import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trivia/src/data/repositories/local_repository.dart';
import 'package:trivia/src/data/sources/local_consumer.dart';
import 'package:trivia/src/domain/entities/question.dart';
import 'package:trivia/src/domain/usecases/get_question_list.dart';
import 'package:trivia/src/features/question/dtos/question_data.dart';
import 'package:trivia/src/features/question/logic/question_state.dart';
import 'package:trivia/src/features/question/logic/question_utils.dart';


part 'question_state_notifier.dart';

/// Question state notifier logic
final questionNotifierProvider =
    StateNotifierProvider.autoDispose<QuestionNotifier, QuestionState>(
  (ref) => QuestionNotifier(
    getQuestionListUseCase: ref.read(_useCaseProvider),
  ),
);

final _useCaseProvider = Provider.autoDispose(
  (ref) => GetQuestionList(ref.read(_repositoryProvider)),
);

final _repositoryProvider = Provider.autoDispose(
  (ref) => LocalRepositoryImpl(ref.read(_consumerProvider)),
);

final _consumerProvider = Provider.autoDispose((ref) => LocalConsumer());

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trivia/src/domain/entities/question.dart';
import 'package:trivia/src/domain/exceptions/failure.dart';
import 'package:trivia/src/domain/usecases/get_question_list.dart';
import 'package:trivia/src/features/question/logic/question_provider.dart';
import 'package:trivia/src/features/question/logic/question_state.dart';

import 'mock_data.dart';

class MockQuestionUseCase extends Mock implements GetQuestionList {}

void main() {
  late MockQuestionUseCase mockUseCase;
  late QuestionNotifier sut;

  setUp(() {
    mockUseCase = MockQuestionUseCase();
    sut = QuestionNotifier(getQuestionList: mockUseCase);
  });

  void arrangeUseCareReturnMockData() {
    when(() => mockUseCase('')).thenAnswer(
          (_) => Future.value(Right(mockData)),
    );
  }

  group('Question List Notifier Provider', () {
    test('Initial Value is Correct', () {
      expect(sut.debugState, const QuestionState.initial());
      expect(sut.questions, <List<Question>>[]);
    });

    test('Assert Get Question List Use Case is called', () async {
      arrangeUseCareReturnMockData();
      await sut.getList('');
      verify(() => mockUseCase('')).called(1);
    });

    test('Get Question List', () async {
      arrangeUseCareReturnMockData();

      final future = sut.getList('');
      expect(sut.debugState, const QuestionState.loading());
      await future;
      expect(sut.questions, mockData);
      expect(sut.debugState, QuestionState.data(questionList: mockData));
    });

    test('Get Question List Fail', () async {
      when(() => mockUseCase('')).thenAnswer(
            (_) => Future.value(const Left(Failure('There were errors'))),
      );

      await sut.getList('');
      expect(sut.debugState, const QuestionState.error('There were errors'));
    });
  });
}

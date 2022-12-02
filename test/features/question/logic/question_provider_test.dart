import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
    });

    test('Assert Get Question List Use Case is called', () async {
      arrangeUseCareReturnMockData();
      await sut.loadList('');
      verify(() => mockUseCase('')).called(1);
    });

    test('Get Question List', () async {
      arrangeUseCareReturnMockData();

      final future = sut.loadList('');
      expect(sut.debugState, const QuestionState.loading());
      await future;
      expect(sut.debugState, QuestionState.data(question: mockData[0]));
    });

    test('Get Question List Fail', () async {
      when(() => mockUseCase('')).thenAnswer(
        (_) => Future.value(const Left(Failure('There were errors'))),
      );

      await sut.loadList('');
      expect(sut.debugState, const QuestionState.error('There were errors'));
    });

    test('Get question list from real local source ', () async {
      await sut.loadList('assets/data/nivel_1.json');
      expect(sut.debugState, QuestionState.data(question: mockData[0]));
    });
  });
}

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

  setUpAll(() {
    mockUseCase = MockQuestionUseCase();
  });

  void arrangeUseCareReturnMockData() {
    when(() => mockUseCase('')).thenAnswer(
      (_) => Future.value(Right(mockData)),
    );
  }

  group('Question List Notifier Provider', () {
    late QuestionNotifier sut;

    setUp(() {
      sut =
          QuestionNotifier(getQuestionList: mockUseCase, maxQuestionLength: 3);
      arrangeUseCareReturnMockData();
    });

    test('Initial Value is Correct', () {
      expect(sut.debugState, const QuestionState.initial());
    });

    test('Assert Get Question List Use Case is called', () async {
      arrangeUseCareReturnMockData();
      await sut.loadList('');
      verify(() => mockUseCase('')).called(1);
    });

    test('Get Question List', () async {
      final future = sut.loadList('');
      expect(sut.debugState, const QuestionState.loading());
      await future;

      // Arrange
      Question? actual;
      sut.debugState.mapOrNull(
        data: (data) => actual = data.question.copyWith(),
      );
      final expected =
          mockData.where((element) => element.id == actual?.id).first;

      // Assert
      expect(actual, expected);
    });

    test('Get next question in list', () async {
      await sut.loadList('');
      sut.getNext();

      // Arrange
      Question? actual;
      sut.debugState.mapOrNull(
        data: (data) => actual = data.question.copyWith(),
      );
      final expected =
          mockData.where((element) => element.id == actual?.id).first;

      // Assert
      expect(actual, expected);
    });

    test('Fail when call get question list', () async {
      when(() => mockUseCase('')).thenAnswer(
        (_) => Future.value(const Left(Failure('There were errors'))),
      );

      await sut.loadList('');
      expect(sut.debugState, const QuestionState.error('There were errors'));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trivia/src/data/model/local_dto.dart';
import 'package:trivia/src/data/params/data_params.dart';
import 'package:trivia/src/data/repositories/local_repository.dart';
import 'package:trivia/src/data/sources/local_consumer.dart';
import 'package:trivia/src/domain/dtos/failure.dart';
import 'package:trivia/src/domain/entities/answer.dart' as entity;
import 'package:trivia/src/domain/entities/question.dart';

import 'mockData/list_mock.dart';

class LocalConsumerMock extends Mock implements LocalConsumer {}

class FakeDataParams extends Fake implements DataParams {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeDataParams());
  });

  late LocalRepositoryImpl sut;
  late LocalConsumerMock consumerMock;
  late entity.Answer expectedAnswer;

  setUp(() {
    consumerMock = LocalConsumerMock();
    expectedAnswer = const entity.Answer(
      id: 1,
      description: 'Mantener la homeostasia',
      isCorrect: true,
    );
    sut = LocalRepositoryImpl(consumerMock);
  });

  group('Parse local data to Question List', () {
    test('Get question List', () async {
      when(() => consumerMock.consume(any())).thenAnswer(
        (_) => Future.value(const LocalDto(data: listMock)),
      );

      final result = await sut.getData('level_1.json');
      verify(() => consumerMock.consume(any())).called(1);

      result.fold((l) {}, (r) {
        expect(r, isA<List<Question>>());
        expect(r.length, equals(3));
        expect(r[0].id, 1);
        expect(r[0].answers[0], expectedAnswer);
      });
    });

    test('Get error', () async {
      when(() => consumerMock.consume(any())).thenAnswer(
        (_) => Future.value(
          const LocalDto(
            success: false,
            message: 'There were errors loading list',
          ),
        ),
      );

      final result = await sut.getData('level_1.json');
      verify(() => consumerMock.consume(any())).called(1);

      result.fold(
        (l) {
          expect(l, isA<Failure>());
          expect(l.message, 'There were errors loading list');
        } ,
        (r) {

        },
      );
    });
  });
}

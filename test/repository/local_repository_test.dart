import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trivia/src/data/model/local_dto.dart';
import 'package:trivia/src/data/params/data_params.dart';
import 'package:trivia/src/data/params/repo_params.dart';
import 'package:trivia/src/data/repositories/local_repository.dart';
import 'package:trivia/src/data/sources/local_consumer.dart';
import 'package:trivia/src/domain/entities/answer.dart' as entity;
import 'package:trivia/src/domain/entities/question.dart';
import 'package:trivia/src/domain/exceptions/failure.dart';

import 'mockData/list_mock.dart';

class LocalConsumerMock extends Mock implements LocalConsumer {}

class FakeDataParams extends Fake implements DataParams {}

const answerDescription = 'Mantener la homeostasia';
const errorDescription = 'There were errors loading list';

void main() {
  setUpAll(() {
    registerFallbackValue(FakeDataParams());
  });

  late LocalRepositoryImpl sut;
  late LocalConsumerMock consumerMock;
  late entity.Answer expectedAnswer;
  late RepoParams repoParams;

  setUp(() {
    consumerMock = LocalConsumerMock();
    expectedAnswer = const entity.Answer(
      id: 1,
      description: answerDescription,
      isCorrect: true,
    );
    sut = LocalRepositoryImpl(consumerMock);
    repoParams = RepoParams('level1');
  });

  group('Get Question List From Local Resource', () {
    test('Get Question List Success', () async {
      when(() => consumerMock.consume(any())).thenAnswer(
        (_) => Future.value(const LocalDto(data: listMock)),
      );

      final result = await sut.getData(repoParams);
      verify(() => consumerMock.consume(any())).called(1);

      result.fold((l) {}, (r) {
        expect(r, isA<List<Question>>());
        expect(r.length, equals(3));
        expect(r[0].id, 1);
        expect(r[0].answers[0], expectedAnswer);
      });
    });

    test('Get error when getting Question List ', () async {
      when(() => consumerMock.consume(any())).thenAnswer(
        (_) => Future.value(
          const LocalDto(
            success: false,
            message: errorDescription,
          ),
        ),
      );

      final result = await sut.getData(repoParams);
      verify(() => consumerMock.consume(any())).called(1);

      result.fold(
        (l) {
          expect(l, isA<Failure>());
          expect(l.message, errorDescription);
        } ,
        (r) {

        },
      );
    });
  });
}

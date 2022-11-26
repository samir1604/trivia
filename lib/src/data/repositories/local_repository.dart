import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:dartz/dartz.dart';
import 'package:trivia/src/data/params/data_params.dart';
import 'package:trivia/src/data/params/repo_params.dart';

import 'package:trivia/src/data/sources/local_consumer.dart';
import 'package:trivia/src/domain/contracts/repository.dart';

import 'package:trivia/src/domain/entities/question.dart';
import 'package:trivia/src/domain/exceptions/failure.dart';

/// Local repository implementation
class LocalRepositoryImpl
    extends Repository<Either<Failure, List<Question>>, RepoParams> {
  /// Constructor
  LocalRepositoryImpl(this._consumer);

  final LocalConsumer _consumer;

  @override
  Future<Either<Failure, List<Question>>> getData(RepoParams params) async {
    final result = await _consumer.consume(DataParams(params.level));

    if (!result.success) {
      return Left(Failure(result.message));
    }

    final decodeList = jsonDecode(result.data!) as List;
    final questionList = decodeList
        .mapIndexed(
          (index, element) =>
              Question.fromJson(index + 1, element as Map<String, dynamic>),
        )
        .toList();

    return Right(questionList);
  }
}

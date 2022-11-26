import 'package:dartz/dartz.dart';
import 'package:trivia/src/data/params/repo_params.dart';
import 'package:trivia/src/domain/contracts/repository.dart';

import 'package:trivia/src/domain/entities/question.dart';
import 'package:trivia/src/domain/exceptions/failure.dart';

/// Get question list use case
class GetQuestionList {
  /// Constructor
  const GetQuestionList(this._repository);

  final Repository<Either<Failure, List<Question>>, RepoParams> _repository;

  /// Get question list method
  Future<Either<Failure, List<Question>>> call(String level ) {
    return _repository.getData(RepoParams(level));
  }
}

import 'package:dartz/dartz.dart';
import 'package:trivia/src/domain/contracts/repository.dart';
import 'package:trivia/src/domain/dtos/failure.dart';
import 'package:trivia/src/domain/entities/question.dart';

/// Get question list use case
class GetQuestionList {
  /// Constructor
  const GetQuestionList(this._repository);

  final Repository<Either<Failure, List<Question>>> _repository;

  /// Get question list method
  Future<Either<Failure, List<Question>>> call(String level ) {
    return _repository.getData(level);
  }
}

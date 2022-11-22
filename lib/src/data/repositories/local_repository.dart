import 'package:trivia/src/domain/contracts/repository.dart';
import 'package:trivia/src/data/model/local_dto.dart';
import 'package:trivia/src/domain/entities/question.dart';

/// Local repository implementation
class LocalRepositoryImpl extends Repository<String> {
  /// Constructor
  LocalRepositoryImpl(super.consumer);

  @override
  Future<String> getData(String level) {
    // TODO: implement getData
    throw UnimplementedError();
  }

}

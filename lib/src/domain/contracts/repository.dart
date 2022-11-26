import 'package:trivia/src/domain/contracts/params.dart';

/// Abstract class for repositories
abstract class Repository<T, P extends Params> {
  /// Get data
  Future<T> getData(P params);
}

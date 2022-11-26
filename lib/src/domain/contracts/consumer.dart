import 'package:trivia/src/domain/contracts/dto.dart';
import 'package:trivia/src/domain/contracts/params.dart';

/// Abstract class for consumer data
abstract class Consumer<T extends Dto<dynamic>, P extends Params> {
  /// Abstract consume method
  Future<T> consume(P uri);
}

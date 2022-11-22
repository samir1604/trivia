import 'package:trivia/src/domain/contracts/consumer.dart';

/// Abstract class for repositories
abstract class Repository<T> {
  /// Constructor
  const Repository(this.consumer);

  /// Consumer
  final Consumer<Map<String, dynamic>> consumer;

  /// Get data
  Future<T> getData(String level);
}

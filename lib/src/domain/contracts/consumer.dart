/// Abstract class for consumer data
abstract class Consumer<T> {
  /// Abstract consume method
  Future<T> consume(String uri);
}

/// Abstract class for repositories
abstract class Repository<T> {
  /// Get data
  Future<T> getData(String level);
}

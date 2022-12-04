import 'dart:math';

/// List Extension Methods
extension ListExtension<T> on List<T> {
  /// Get random items of a list
  List<T> getRandomList(int maxSelected) => _selectItems(maxSelected);

  /// Get un order list of elements
  List<T> getUnOrderList() => _selectItems(length);

  List<T> _selectItems(int max) {
    final setOfInts = <int>{};
    while (setOfInts.length < max) {
      setOfInts.add(Random().nextInt(length));
    }

    return List<T>.generate(
      setOfInts.length,
      (index) => this[setOfInts.elementAt(index)],
    );
  }
}

import 'dart:convert';

/// Abstract class for response
abstract class Dto<T> {
  /// Constructor
  const Dto({this.success = true, this.message = '', this.data});

  /// Value is true if is not error loading the data
  final bool success;
  /// Value of the error message
  final String message;
  /// Value of the data
  final T? data;
}

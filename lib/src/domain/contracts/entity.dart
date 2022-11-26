import 'package:equatable/equatable.dart';

/// Abstract class for entity implementation
abstract class Entity extends Equatable {
  /// Constructor
  const Entity({required this.id});

  /// Entity Id
  final int id;
}

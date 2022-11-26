import 'package:trivia/src/domain/contracts/params.dart';

/// Params for local data
class DataParams extends Params {
  /// Constructor
  DataParams(this.uri);
  /// Uri value
  final String uri;

  @override
  List<Object?> get props => [uri];
}

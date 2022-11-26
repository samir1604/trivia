import 'package:trivia/src/domain/contracts/params.dart';

/// Parans for repository
class RepoParams extends Params {
  /// Constructor
  RepoParams(this.level);

  /// Level uri
  final String level;

  @override
  List<Object?> get props => [level];
}

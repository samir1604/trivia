import 'package:trivia/src/domain/contracts/dto.dart';

/// Response dto class
class LocalDto extends Dto<String> {
  /// Constructor
  const LocalDto({super.success, super.message, super.data});
}

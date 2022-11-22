import 'package:flutter/services.dart';
import 'package:trivia/src/data/model/local_dto.dart';
import 'package:trivia/src/domain/contracts/consumer.dart';

/// Load value from assets
class LocalConsumer implements Consumer<LocalDto> {
  @override
  Future<LocalDto> consume(String uri) async {
    try {
      final result = await rootBundle.loadString(uri);
      if (result.isEmpty) {
        return const LocalDto(
          success: false,
          message: 'No hay datos que mostrar',
        );
      }

      return LocalDto(data: result);
    } on Exception catch (e) {
      return LocalDto(success: false, message: e.toString());
    }
  }
}

import 'package:flutter/services.dart';
import 'package:trivia/src/data/model/local_dto.dart';
import 'package:trivia/src/data/params/data_params.dart';
import 'package:trivia/src/domain/contracts/consumer.dart';

/// Load value from assets
class LocalConsumer implements Consumer<LocalDto, DataParams> {
  @override
  Future<LocalDto> consume(DataParams params) async {
    try {
      final result = await rootBundle.loadString(params.uri);
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

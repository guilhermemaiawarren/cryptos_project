import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/shared/common_model/move_model.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

void main() {
  group('MoveModel tests', () {
    late MoveModel model;
    setUp(() {
      model = MoveModel(
          cashHelper: dp('250'),
          convert: dp('250'),
          convertCoinId: 'id',
          data: DateTime.now(),
          recieve: dp('250'),
          recieveCoinId: 'recieveId');
    });

    test('WHEN MoveModel.toMap() THEN match expected return', () {
      Map<String, dynamic> modelToMap = model.toMap();

      expect(Decimal.parse(modelToMap['cashHelper']), dp('250'));
      expect(Decimal.parse(modelToMap['convert']), dp('250'));
      expect(modelToMap['convertCoinId'], 'id');
      expect(modelToMap['data'], model.data.millisecondsSinceEpoch);
      expect(Decimal.parse(modelToMap['recieve']), dp('250'));
      expect(modelToMap['recieveCoinId'], 'recieveId');
    });
    test('WHEN MoveModel.fromMap() THEN match expected return', () {
      Map<String, dynamic> modelToMap = model.toMap();

      MoveModel newModel = MoveModel.fromMap(modelToMap);

      expect(newModel.cashHelper, dp('250'));
      expect(newModel.convert, dp('250'));
      expect(newModel.convertCoinId, 'id');
      expect(newModel.data.hour, model.data.hour);
      expect(newModel.recieve, dp('250'));
      expect(newModel.recieveCoinId, 'recieveId');
    });
    test('WHEN MoveModel.toJson() THEN match expected return', () {
      String jsonModel = model.toJson();

      expect(jsonModel, jsonEncode(model.toMap()));
    });
    test('WHEN MoveModel.fromJson() THEN match expected return', () {
      MoveModel newModel = MoveModel.fromJson(model.toJson());

      expect(newModel.cashHelper, dp('250'));
    });
  });
}

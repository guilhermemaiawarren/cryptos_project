import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/shared/utils/arguments/to_conversion_arguments.dart';
import 'package:projeto_criptos/shared/utils/arguments/to_details_arguments.dart';
import 'package:projeto_criptos/shared/utils/arguments/to_revision_arguments.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../setup/common_asset.dart';

void main() {
  group('Arguments Tests', () {
    test('To conversion arguments', () {
      final arguments = ToConversionArguments(
          cryptoAmmount: dp('250'), crypto: TestAsset.model, data: [], coinAmmountList: []);

      expect(arguments.crypto, TestAsset.model);
      expect(arguments.cryptoAmmount, dp('250'));
      expect(arguments.data, []);
      expect(arguments.coinAmmountList, []);

    });
    test('To Revision arguments', () {
      final arguments = ToRevisionArguments(
          convert: dp('250'),
          recieve: dp('250'),
          convertCoin: TestAsset.model,
          recieveCoin: TestAsset.model);
      expect(arguments.convertCoin, TestAsset.model);
      expect(arguments.recieveCoin, TestAsset.model);
      expect(arguments.convert, dp('250'));
      expect(arguments.recieve, dp('250'));
    });
    test('To Details arguments', () {
      final arguments = ToDetailsArguments(crypto: TestAsset.model, coinAmmount: dp('250'));

      expect(arguments.crypto, TestAsset.model);
      expect(arguments.coinAmmount, dp('250'));
    });
  });
}

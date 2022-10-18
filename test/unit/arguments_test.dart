import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/shared/utils/arguments/conversion_arguments.dart';
import 'package:projeto_criptos/shared/utils/arguments/details_arguments.dart';
import 'package:projeto_criptos/shared/utils/arguments/review_arguments.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../setup/common_asset.dart';

void main() {
  group('Arguments Tests', () {
    test('To conversion arguments TEST', () {
      final arguments = ConversionArguments(
          cryptoAmmount: dp('250'),
          crypto: TestAsset.cryptoViewData,
          data: [],
          coinAmmountList: []);

      expect(arguments.crypto, TestAsset.cryptoViewData);
      expect(arguments.cryptoAmmount, dp('250'));
      expect(arguments.data, []);
      expect(arguments.coinAmmountList, []);
    });
    test('To Revision arguments TEST', () {
      final arguments = ReviewArguments(
          convert: dp('250'),
          recieve: dp('250'),
          convertCoin: TestAsset.cryptoViewData,
          recieveCoin: TestAsset.cryptoViewData,
          data: []);
      expect(arguments.convertCoin, TestAsset.cryptoViewData);
      expect(arguments.recieveCoin, TestAsset.cryptoViewData);
      expect(arguments.convert, dp('250'));
      expect(arguments.recieve, dp('250'));
    });
    test('To Details arguments TEST', () {
      final arguments = DetailsArguments(
          crypto: TestAsset.cryptoViewData, coinAmmount: dp('250'));

      expect(arguments.crypto.id, TestAsset.cryptoViewData.id);
      expect(arguments.coinAmmount, dp('250'));
    });
  });
}

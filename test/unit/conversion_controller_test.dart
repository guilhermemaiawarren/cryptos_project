import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/controller/conversion_controller.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../setup/common_asset.dart';

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });
  List<CryptoViewData> data = [
    TestAsset.cryptoViewData,
    TestAsset.cryptoViewData
  ];
  List<double> coinAmmountList = [23232, 323232, 3232];
  ConversionController controller = ConversionController();
  group('Tests with ConversionController', () {
    setUp(() {
      controller.controllerInit(
          TestAsset.model, dp('250'), data, coinAmmountList);
    });
    test('WHEN conversionController.init THEN compare matchers', () {
      expect(controller.asset.id, TestAsset.model.id);
      expect(controller.assetHelper, dp('0'));
      expect(controller.coinAmmount, dp('250'));
      expect(controller.convertHelper, dp('0'));
      expect(controller.convertedCryptoHelper, dp('0'));
      expect(controller.cryptoConverted.id, TestAsset.model.id);
      expect(controller.cryptos, data);
      expect(controller.validate, false);
    });

    test('WHEN controller.coinRegExp THEN confirm return is correct', () {
      String value = controller.coinRegExp('250,21');
      String value2 = controller.coinRegExp('250-21');
      String value3 = controller.coinRegExp('250\$21');

      expect(value, '250.21');
      expect(value2, '250.21');
      expect(value3, '250.21');
    });

    test('WHEN controller.validCoinValue THEN confirm return is expected', () {
      bool validate = controller.validCoinValue('.250.21');
      bool validate2 = controller.validCoinValue('-250.21');
      bool validate3 = controller.validCoinValue('250.21');
      String value = controller.coinRegExp('250,21');
      bool validate4 = controller.validCoinValue('250,21');

      expect(validate, false);
      expect(validate2, false);
      expect(validate3, true);
      expect(validate4, true);
      expect(controller.validCoinValue(value), true);
    });

    test('WHEN controller.convertedValue THEN confirm return is expected', () {
      controller.convertedValue('250');
      //convertHelper = 250 * 250 = 62500
      //convertedCryptoHelper = 62500 / 250 = 250
      expect(controller.convertHelper, dp('62500'));
      expect(controller.convertedCryptoHelper, dp('250'));
    });
    test('WHEN controller.buttonValidation() THEN confirm return expected',
        () async {
      controller.buttonValidation(GlobalKey<FormState>());

      expect(controller.validate, false);
    });

    test('WHEN controller.changeConvertedCoin THEN confirm return is expected',
        () {
      controller.changeConvertedCoin(
          TestAsset.model, '250', GlobalKey<FormState>());
      expect(controller.cryptoConverted.id, TestAsset.model.id);
      expect(controller.asset.id, TestAsset.model.id);
      expect(controller.convertHelper, dp('0'));
      expect(controller.convertedCryptoHelper, dp('0'));
      expect(controller.validate, false);
    });

    test('WHEN controller.swapCoins THEN confirm return expected', () {
      controller.swapCoins();
      expect(controller.asset.id, TestAsset.model.id);
      expect(controller.cryptoConverted.id, TestAsset.model.id);
      expect(controller.convertHelper, dp('0'));
      expect(controller.convertedCryptoHelper, dp('0'));
      expect(controller.validate, false);
    });

    test('WHEN controller.changeRecieveCoin THEN return must be expected', () {
      controller.changeRecieveCoin(
          TestAsset.model, GlobalKey<FormState>(), '250');

      expect(controller.cryptoConverted.id, TestAsset.model.id);
      expect(controller.asset.id, TestAsset.model.id);
      expect(controller.validate, false);
      expect(controller.convertHelper, dp('62500'));
      expect(controller.convertedCryptoHelper, dp('250'));
    });
  });
}

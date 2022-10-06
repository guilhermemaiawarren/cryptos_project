import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/common_model/crypto.dart';
import '../../shared/utils/decimal_parse.dart';

class ConversionController extends ChangeNotifier {
  late CryptoEntity cryptoConverted;
  late CryptoEntity asset;
  late Decimal coinAmmount;
  bool validate = false;
  late Decimal convertHelper;
  late Decimal convertedCryptoHelper;
  late List<CryptoViewData> cryptos;
  late Decimal assetHelper;

  String coinRegExp(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  bool validCoinValue(String source) {
    return !source.startsWith(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  controllerInit(
      CryptoEntity asset, Decimal coinAmmount, List<CryptoViewData> data) {
    cryptos = data;
    this.coinAmmount = coinAmmount;
    this.asset = asset;
    this.asset.id == "bitcoin"
        ? cryptoConverted = cryptos[1]
        : cryptoConverted = cryptos[0];
    convertHelper = dp('0');
    convertedCryptoHelper = dp('0');
    assetHelper = dp('0');
  }

  convertedValue(String value) {
    convertHelper = dp(coinRegExp(value)) * asset.currentPrice;
    convertedCryptoHelper = dp(
        (convertHelper.toDouble() / cryptoConverted.currentPrice.toDouble())
            .toString());
  }

  buttonValidation(GlobalKey<FormState> formKey) {
    validate = formKey.currentState!.validate() ? true : false;
    notifyListeners();
  }

  changeConvertedCoin(
      CryptoEntity crypto, String value, GlobalKey<FormState> formKey) {
    if (crypto.id == cryptoConverted.id) {
      cryptoConverted = asset;
    }
    asset = crypto;
    convertedValue(value);
    buttonValidation(formKey);
    notifyListeners();
  }

  swapCoins() {
    CryptoEntity temp = asset;
    asset = cryptoConverted;
    cryptoConverted = temp;
    convertedValue('0');
    validate = false;
    notifyListeners();
  }

  changeRecieveCoin(
      CryptoEntity crypto, GlobalKey<FormState> formKey, String value) {
    CryptoEntity temp = cryptoConverted;
    cryptoConverted = crypto;
    if (cryptoConverted.id == asset.id) {
      asset = temp;
    }
    buttonValidation(formKey);
    convertedValue(value);
  }
}

import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/arguments/to_revision_arguments.dart';
import '../../shared/utils/decimal_parse.dart';

class ConversionController extends ChangeNotifier {
  CryptoViewData cryptoConverted = CryptoViewData();
  CryptoViewData asset = CryptoViewData();
  Decimal coinAmmount = dp('250');
  bool validate = false;
  Decimal convertHelper = dp('250');
  Decimal convertedCryptoHelper = dp('0.0');
  List<CryptoViewData> cryptos = [];
  Decimal assetHelper = dp('0.0');
  List<double> coinAmmountList = [];

  String coinRegExp(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  bool validCoinValue(String source) {
    return !source.startsWith(RegExp(r'[-!@#$%^&*(),.?":{}|<>]'));
  }

  controllerInit(CryptoViewData asset, Decimal coinAmmount,
      List<CryptoViewData> data, List<double> coinAmmountList) {
    cryptos = data;
    this.coinAmmountList = coinAmmountList;
    validate = false;
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
    if (formKey.currentState != null) {
      validate = formKey.currentState!.validate() ? true : false;
    } else {
      validate = false;
    }
    notifyListeners();
  }

  changeConvertedCoin(CryptoViewData crypto, GlobalKey<FormState> formKey) {
    if (crypto.id == cryptoConverted.id) {
      cryptoConverted = asset;
    }
    asset = crypto;
    coinAmmount = dp(
      (coinAmmountList)[cryptos.indexWhere((item) => item.id == asset.id)]
          .toString(),
    );
    buttonValidation(formKey);
    convertedValue('0.0');
    notifyListeners();
  }

  swapCoins() {
    CryptoViewData temp = asset;
    asset = cryptoConverted;
    cryptoConverted = temp;
    coinAmmount = dp(
      (coinAmmountList)[cryptos.indexWhere((item) => item.id == asset.id)]
          .toString(),
    );
    validate = false;
    convertedValue('0.0');
    notifyListeners();
  }

  changeRecieveCoin(CryptoViewData crypto, GlobalKey<FormState> formKey) {
    CryptoViewData temp = cryptoConverted;
    cryptoConverted = crypto;
    if (cryptoConverted.id == asset.id) {
      asset = temp;
    }
    buttonValidation(formKey);
  }

  controllerNavigate(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/revision',
      arguments: ToRevisionArguments(
        convert: assetHelper,
        recieve: convertedCryptoHelper,
        convertCoin: asset,
        recieveCoin: cryptoConverted,
        data: cryptos,
      ),
    );
  }
}

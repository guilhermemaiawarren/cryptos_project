import 'package:projeto_criptos/shared/common_model/crypto.dart';

import '../../../shared/utils/decimal_to_double.dart';

class ConversionMethods {
  static String coinRegExp(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  static bool validCoinValue(String source) {
    return source.startsWith(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  static getExchange(CryptoEntity asset, CryptoEntity cryptoConverted) {
    String convert = '1 ${asset.symbol.toUpperCase()}';
    String recieve =
        '${(dtd(asset.currentPrice) / dtd(cryptoConverted.currentPrice)).toStringAsFixed(7)} ${cryptoConverted.symbol.toUpperCase()}';
    return '$convert = $recieve';
  }
}

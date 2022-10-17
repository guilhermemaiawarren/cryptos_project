import 'package:decimal/decimal.dart';

import '../../../portfolio/model/crypto_view_data.dart';


class ConversionArguments {
  final Decimal cryptoAmmount;
  final CryptoViewData crypto;
  final List<CryptoViewData> data;
  final List<double> coinAmmountList;
  ConversionArguments({
    required this.cryptoAmmount,
    required this.crypto,
    required this.data,
    required this.coinAmmountList,
  });
}

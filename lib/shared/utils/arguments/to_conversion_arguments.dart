import 'package:decimal/decimal.dart';

import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';


class ToConversionArguments {
  final Decimal cryptoAmmount;
  final CryptoViewData crypto;
  final List<CryptoViewData> data;
  final List<double> coinAmmountList;
  ToConversionArguments({
    required this.cryptoAmmount,
    required this.crypto,
    required this.data,
    required this.coinAmmountList,
  });
}

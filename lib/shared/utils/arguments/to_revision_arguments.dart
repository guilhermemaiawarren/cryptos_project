import 'package:decimal/decimal.dart';

import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import '../../common_model/crypto.dart';

class ToRevisionArguments {
  Decimal convert;
  Decimal recieve;
  CryptoEntity convertCoin;
  CryptoEntity recieveCoin;
  List<CryptoViewData> data;
  ToRevisionArguments({
    required this.convert,
    required this.recieve,
    required this.convertCoin,
    required this.recieveCoin,
    required this.data,
  });
}

import 'package:decimal/decimal.dart';

import '../../../portfolio/model/crypto_view_data.dart';

class ToRevisionArguments {
  Decimal convert;
  Decimal recieve;
  CryptoViewData convertCoin;
  CryptoViewData recieveCoin;
  List<CryptoViewData> data;
  ToRevisionArguments({
    required this.convert,
    required this.recieve,
    required this.convertCoin,
    required this.recieveCoin,
    required this.data,
  });
}

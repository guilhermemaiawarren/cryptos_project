import 'package:decimal/decimal.dart';

import '../../common_model/crypto.dart';

class ToRevisionArguments {
  Decimal convert;
  Decimal recieve;
  CryptoEntity convertCoin;
  CryptoEntity recieveCoin;
  ToRevisionArguments({
    required this.convert,
    required this.recieve,
    required this.convertCoin,
    required this.recieveCoin,
  });
}

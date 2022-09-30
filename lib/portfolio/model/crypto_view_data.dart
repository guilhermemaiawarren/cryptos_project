import 'package:decimal/decimal.dart';

import '../../shared/common_model/crypto.dart';

class CryptoViewData extends CryptoEntity {
  CryptoViewData({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required Decimal currentPrice,
    required double variation,
  }) : super(
          currentPrice: currentPrice,
          id: id,
          image: image,
          name: name,
          symbol: symbol,
          variation: variation,
        );
}

import 'package:decimal/decimal.dart';

import '../../shared/common_model/crypto.dart';

class CryptoViewData extends CryptoEntity {
  CryptoViewData({
     String id = '',
     String symbol = '',
     String name = '',
     String image = '',
     Decimal? currentPrice,
     double variation = 0,
  }) : super(
          currentPrice: currentPrice!,
          id: id,
          image: image,
          name: name,
          symbol: symbol,
          variation: variation,
        );
}

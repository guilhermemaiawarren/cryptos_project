import 'package:decimal/decimal.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';

class CryptoConversionViewData extends CryptoEntity {
  CryptoConversionViewData({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required Decimal currentPrice,
    required double variation,
  }) : super(
          id: id,
          symbol: symbol,
          name: name,
          image: image,
          currentPrice: currentPrice,
          variation: variation,
        );
}

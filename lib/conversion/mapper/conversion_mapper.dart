import 'package:projeto_criptos/conversion/model/conversion_crypto_view_data.dart';
import 'package:projeto_criptos/shared/api/models/get_all_cryptos_response.dart';

extension ConversionMapper on GetAllCryptosResponse {
  List<ConversionCryptoViewData> toViewData() {
    return cryptos
        .map(
          (crypto) => ConversionCryptoViewData(
            id: crypto.id,
            symbol: crypto.symbol,
            name: crypto.name,
            image: crypto.image,
            currentPrice: crypto.currentPrice,
            variation: crypto.variation,
          ),
        )
        .toList();
  }
}

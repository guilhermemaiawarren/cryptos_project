import '../../shared/api/models/get_all_cryptos_response.dart';
import '../model/crypto_view_data.dart';

extension CryptosMapper on GetAllCryptosResponse {
  List<CryptoViewData> toViewData() {
    return cryptos
        .map(
          (crypto) => CryptoViewData(
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

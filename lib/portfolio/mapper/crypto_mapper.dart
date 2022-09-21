import '../../shared/api/models/get_all_cryptos_response.dart';
import '../model/crypto_view_data.dart';

extension CryptosMapper on GetAllCryptosResponse {
  List<CryptoViewData> toViewData() { 
    return cryptos
        .map(
          (e) => CryptoViewData(
              id: e.id,
              symbol: e.symbol,
              name: e.name,
              image: e.image,
              currentPrice: e.currentPrice,
              variation: e.variation),
        )
        .toList();
  }
}

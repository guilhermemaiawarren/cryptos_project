import '../../shared/api/models/get_crypto_market_data_response.dart';
import '../model/prices_view_data.dart';

extension PricesMapper on GetCryptoMarketDataResponse {
  PricesViewData toViewData() {
    return PricesViewData(
      List.from(
        prices.map(
          (e) {
            return e;
          },
        ),
      ),
    );
  }
}

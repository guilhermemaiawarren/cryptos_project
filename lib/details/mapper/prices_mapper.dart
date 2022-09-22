import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/shared/api/models/get_crypto_market_data_response.dart';

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

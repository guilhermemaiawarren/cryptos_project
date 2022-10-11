import 'package:faker/faker.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';

import 'common_asset.dart';
Faker faker = Faker();
class FakeDataRepository {
  static Future<List<CryptoViewData>> getAllCryptos() {
    Future<List<CryptoViewData>> cryptos =
        Future.delayed(const Duration(seconds: 1), () {
      return [
        TestAsset.cryptoViewData,
        TestAsset.cryptoViewData2,
        TestAsset.cryptoViewData3,
      ];
    });
    return cryptos;
  }

  static Future<PricesViewData> getPricesData(String id) {
    Future<PricesViewData> pricesData =
        Future.delayed(const Duration(seconds: 1), () {
      return PricesViewData([
        [faker.randomGenerator.integer(10), faker.randomGenerator.integer(10)],
        [faker.randomGenerator.integer(10), faker.randomGenerator.integer(10)],
        [faker.randomGenerator.integer(10), faker.randomGenerator.integer(10)],
        [faker.randomGenerator.integer(10), faker.randomGenerator.integer(10)],
        [faker.randomGenerator.integer(10), faker.randomGenerator.integer(10)],
        [faker.randomGenerator.integer(10), faker.randomGenerator.integer(10)],
      ]);
    });
    return pricesData;
  }
}

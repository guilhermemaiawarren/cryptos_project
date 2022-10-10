import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/shared/api/models/cryptos_response.dart';
import 'package:projeto_criptos/shared/api/models/get_crypto_market_data_response.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

void main() {
  group('Responses methods tests', () {
    test(
      'WHEN cryptosReponse.toJson THEN match expected return',
      () async {
        CryptosResponse response =
            CryptosResponse('', '', '', '', dp('250'), 5);

        expect(response.toJson(), {
          'id': '',
          'symbol': '',
          'name': '',
          'image': '',
          'current_price': dp('250'),
          'price_change_percentage_24h': 5.0
        });
      },
    );

    test('WHEN getCryptoMarkteDataResponse.toJson THEN match expected return',
        () async {
      GetCryptoMarketDataResponse response = GetCryptoMarketDataResponse(
        [
          [25, 25],
          [25, 25],
          [25, 25]
        ],
      );

      expect(response.toJson(), {
        'prices': [
          [25, 25],
          [25, 25],
          [25, 25]
        ]
      });
    });
  });
}

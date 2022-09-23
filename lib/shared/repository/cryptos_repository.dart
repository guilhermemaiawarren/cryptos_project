import '../api/cryptos_endpoint.dart';
import '../api/models/cryptos_response.dart';
import '../api/models/get_all_cryptos_response.dart';
import '../api/models/get_crypto_market_data_response.dart';

class CryptosRepository {
  final CryptosEndpoint _endpoint;

  CryptosRepository(this._endpoint);

  Future<GetAllCryptosResponse> getAllCryptos() async {
    final response = await _endpoint.getAllCryptos();
    return GetAllCryptosResponse(
      List.from(
        response.data.map(
          (crypto) {
            return CryptosResponse.fromMap(crypto);
          },
        ),
      ),
    );
  }

  Future<GetCryptoMarketDataResponse> getCryptoMarketData(String crypto) async {
    final response = await _endpoint.getCryptoMarketData(crypto);
    return GetCryptoMarketDataResponse.fromJson(response.data);
  }
}

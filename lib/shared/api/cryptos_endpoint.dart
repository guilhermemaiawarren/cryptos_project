import 'package:dio/dio.dart';

class CryptosEndpoint {
  final Dio _dio;

  CryptosEndpoint(this._dio);
  Future<Response> getAllCryptos() async {
    return await _dio.get(
        '/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=17&page=1&sparkline=false');
  }

  Future<Response> getCryptoMarketData(String crypto) async {
    return await _dio.get(
        '/coins/$crypto/market_chart?vs_currency=brl&days=365&interval=daily');
  }
}

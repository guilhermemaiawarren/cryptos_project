import 'package:dio/dio.dart';

class CryptosEndpoint {
  final Dio _dio;

  CryptosEndpoint(this._dio);
  Future<Response> getAllCryptos() async {
    return await _dio.get(
        '/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }

  Future<Response> getCryptoMarketData(String crypto, int time) async {
    return await _dio.get(
        '/coins/$crypto/ohlc?vs_currency=brl&days=$time');
  }
}

import 'dart:io';

import 'package:dio/dio.dart';

class CryptosEndpoint {
  final Dio _dio;
  final String currency = Platform.localeName == 'pt_BR' ? 'brl' : 'usd'; 
  CryptosEndpoint(this._dio);
  Future<Response> getAllCryptos() async {
    return await _dio.get(
        '/coins/markets?vs_currency=$currency&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }

  Future<Response> getCryptoMarketData(String crypto) async {
    return await _dio.get(
        '/coins/$crypto/market_chart?vs_currency=$currency&days=365&interval=daily');
  }
}

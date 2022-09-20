import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_criptos/details/data/datasources/get_historic_data_datasource.dart';

class GetHistoricDataDatasourceImpl implements IGetHistoricDataDatasource {
  GetHistoricDataDatasourceImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<double>> getMarketData(String moeda, int tempo) async {
    String url =
        'https://api.coingecko.com/api/v3/coins/$moeda/ohlc?vs_currency=usd&days=$tempo';
    List<double> prices = [];
    try {
      final response = await _dio.get(url);
      for(List<dynamic> list in response.data) {
        prices.add(list[4]);
      }
    } catch (e, s) {
      debugPrint("$e $s");
    }
    return prices;
  }
}

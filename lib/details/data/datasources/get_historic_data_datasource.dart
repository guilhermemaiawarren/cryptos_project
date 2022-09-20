abstract class IGetHistoricDataDatasource {
  Future<List<double>> getMarketData(String moeda, int tempo); 
}
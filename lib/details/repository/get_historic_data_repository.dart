import 'package:projeto_criptos/details/data/datasources/get_historic_data_datasource.dart';

abstract class IGetHistoricDataRepository {
  Future<List<double>> getMarketData(String moeda, int tempo);
}

class GetHistoricDataRepositoryImpl implements IGetHistoricDataRepository {
  GetHistoricDataRepositoryImpl(this._datasource);
  final IGetHistoricDataDatasource _datasource;
  @override
  Future<List<double>> getMarketData(String moeda, int tempo) {
    return _datasource.getMarketData(moeda, tempo);
  }
}

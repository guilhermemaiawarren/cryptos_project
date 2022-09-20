import 'package:projeto_criptos/details/repository/get_historic_data_repository.dart';

abstract class IGetHistoricDataUsecase {
  Future<List<double>> getMarketData(String moeda, int tempo);
}

class GetHistoricDataUsecaseImpl implements IGetHistoricDataUsecase {
  GetHistoricDataUsecaseImpl(this._repository);
  final IGetHistoricDataRepository _repository;
  @override
  Future<List<double>> getMarketData(String moeda, int tempo) {
    return _repository.getMarketData(moeda, tempo);
  }
}

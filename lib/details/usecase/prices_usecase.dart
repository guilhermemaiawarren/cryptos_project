import '../../shared/repository/cryptos_repository.dart';
import '../mapper/prices_mapper.dart';
import '../model/prices_view_data.dart';

class PricesUsecase {
  final CryptosRepository _repository;

  PricesUsecase(this._repository);

  Future<PricesViewData> getPrices(String crypto) async {
    final response = await _repository.getCryptoMarketData(crypto);
    return response.toViewData();
  }
}

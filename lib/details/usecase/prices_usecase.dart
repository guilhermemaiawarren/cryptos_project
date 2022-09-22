
import 'package:projeto_criptos/details/mapper/prices_mapper.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/shared/repository/cryptos_repository.dart';

class PricesUsecase {
  final CryptosRepository _repository;

  PricesUsecase(this._repository);

  Future<PricesViewData> execute(String crypto) async {
    final response = await _repository.getCryptoMarketData(crypto);
    return response.toViewData();
  }
}
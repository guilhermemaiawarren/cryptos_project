import 'package:projeto_criptos/portfolio/mapper/crypto_mapper.dart';

import '../../shared/repository/cryptos_repository.dart';
import '../model/crypto_view_data.dart';

class CryptosUsecase {
  final CryptosRepository _repository;
  CryptosUsecase(this._repository);

  Future<List<CryptoViewData>> execute() async {
    final response = await _repository.getAllCryptos();
    return response.toViewData();
  }
}

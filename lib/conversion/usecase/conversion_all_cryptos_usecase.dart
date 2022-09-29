import 'package:projeto_criptos/conversion/mapper/conversion_mapper.dart';
import 'package:projeto_criptos/conversion/model/conversion_crypto_view_data.dart';

import '../../shared/repository/cryptos_repository.dart';

class ConversionAllCryptosUsecase {
  final CryptosRepository _repository;
  ConversionAllCryptosUsecase(this._repository);

  Future<List<ConversionCryptoViewData>> execute() async {
    final response = await _repository.getAllCryptos();
    return response.toViewData();
  }
}

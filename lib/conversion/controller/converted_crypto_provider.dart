import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/common_model/crypto.dart';
import '../../shared/utils/decimal_parse.dart';

final convertedCryptoProvider = StateProvider<CryptoEntity>((ref) {
  return CryptoEntity(
    id: 'id',
    symbol: 'SELECIONE',
    name: 'name',
    image: '',
    currentPrice: dp('2'),
    variation: 2,
  );
});

final toConvertCryptoProvider = StateProvider<CryptoEntity>((ref) {
  return CryptoEntity(
    id: 'id',
    symbol: 'SELECIONE',
    name: 'name',
    image: '',
    currentPrice: dp('2'),
    variation: 2,
  );
});

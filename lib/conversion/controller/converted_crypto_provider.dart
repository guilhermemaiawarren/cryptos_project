import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';

import '../../shared/utils/decimal_parse.dart';

final convertedCryptoProvider = StateProvider<CryptoEntity>((ref) {
  return CryptoEntity(
    id: 'id',
    symbol: 'symbol',
    name: 'name',
    image: 'image',
    currentPrice: dp('2'),
    variation: 2,
  );
});

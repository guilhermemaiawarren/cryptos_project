import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/decimal_parse.dart';
import '../model/conversion_crypto_view_data.dart';

final convertedCryptoProvider = StateProvider<ConversionCryptoViewData>((ref) {
  return ConversionCryptoViewData(
    id: 'id',
    symbol: 'SELECIONE',
    name: 'name',
    image: '',
    currentPrice: dp('2'),
    variation: 2,
  );
});

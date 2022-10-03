import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/common_model/crypto.dart';
import '../../shared/utils/arguments/to_revision_arguments.dart';
import '../../shared/utils/decimal_parse.dart';

final controllerArgumentsProvider = StateProvider(
  (ref) {
    return ToRevisionArguments(
      convert: dp('0.0'),
      recieve: dp('0.0'),
      convertCoin: CryptoEntity(
        id: 'id',
        symbol: 'symbol',
        name: 'name',
        image: 'image',
        currentPrice: dp('0.0'),
        variation: 2,
      ),
      recieveCoin: CryptoEntity(
        id: 'id',
        symbol: 'symbol',
        name: 'name',
        image: 'image',
        currentPrice: dp('0.0'),
        variation: 2,
      ),
    );
  },
);

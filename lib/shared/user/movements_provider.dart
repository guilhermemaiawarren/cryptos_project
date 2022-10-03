import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/decimal_parse.dart';

import '../common_model/move_model.dart';

final movementsProvider = StateProvider(
  (ref) {
    return [
      MoveModel(
        convert: dp('5.21'),
        recieve: dp('2.21'),
        data: DateTime.now(),
        cashHelper: dp('52102.21'),
        convertCoinId: 'BTC',
        recieveCoinId: 'ETH',
      ),
    ];
  },
);

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/moves/model/movement_model.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

final movementsProvider = StateProvider(
  (ref) {
    return [
      MovementModel(
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

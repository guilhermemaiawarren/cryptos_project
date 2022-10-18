import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCoinAmmountProvider =
    StateNotifierProvider<AmmountNotifier, List<double>>(
  (ref) => AmmountNotifier(),
);

class AmmountNotifier extends StateNotifier<List<double>> {
  AmmountNotifier() : super([]) {
    for (double index = 0; index < 100; index++) {
      state.add(Random().nextDouble() * 100);
    }
  }
}

import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final coinAmmountProvider =
    StateNotifierProvider<AmmountNotifier, List<double>>(
  (ref) => AmmountNotifier(),
);

class AmmountNotifier extends StateNotifier<List<double>> {
  AmmountNotifier() : super([]) {
    for (double index = 0; index < 100; index++) {
      state.add(Random().nextDouble() * 5);
    }
  }
}

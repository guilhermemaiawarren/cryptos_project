import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common_model/move_model.dart';

final movementsProvider = StateProvider<List<MoveModel>>(
  (ref) {
    return [];
  },
);

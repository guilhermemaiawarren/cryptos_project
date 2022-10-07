import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/repository/cryptos_repository_provider.dart';
import '../model/prices_view_data.dart';
import '../usecase/prices_usecase.dart';

final usecaseProvider = Provider(
  (ref) {
    return PricesUsecase(
      ref.watch(cryptosRepositoryProvider),
    );
  },
);

final historicDataProvider = FutureProvider.family<PricesViewData, String>(
  (ref, id) {
    return ref.read(usecaseProvider).getPrices(id);
  },
);

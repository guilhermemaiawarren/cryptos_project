import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/usecase/prices_usecase.dart';
import 'package:projeto_criptos/shared/repository/cryptos_repository_provider.dart';

import '../model/prices_view_data.dart';

final usecaseProvider = Provider(
  (ref) {
    return PricesUsecase(
      ref.watch(cryptosRepositoryProvider),
    );
  },
);

final historicDataProvider = FutureProvider.family<PricesViewData, String>(
  (ref, id) {
    return ref.read(usecaseProvider).execute(id);
  },
);

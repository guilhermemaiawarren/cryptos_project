import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/repository/cryptos_repository_provider.dart';
import '../model/crypto_view_data.dart';
import '../usecase/cryptos_usecase.dart';

final cryptosProviderUsecase = Provider(
  (ref) {
    return CryptosUsecase(
      ref.watch(cryptosRepositoryProvider),
    );
  },
);

final cryptosProvider = FutureProvider<List<CryptoViewData>>(
  (ref) {
    return ref.read(cryptosProviderUsecase).execute();
  },
);

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/usecase/cryptos_usecase.dart';
import 'package:projeto_criptos/shared/repository/cryptos_repository_provider.dart';

import '../model/crypto_view_data.dart';

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

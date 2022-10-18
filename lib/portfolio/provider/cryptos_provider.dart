import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final cryptosProvider = FutureProvider.autoDispose<List<CryptoViewData>>(
  (ref) {
    return ref.read(cryptosProviderUsecase).execute();
  },
);

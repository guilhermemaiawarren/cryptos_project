import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/cryptos_endpoint_provider.dart';
import 'cryptos_repository.dart';

final cryptosRepositoryProvider = Provider(
  (ref) {
    return CryptosRepository(
      ref.watch(cryptosEndpointProvider),
    );
  },
);

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'cryptos_endpoint.dart';

final cryptosEndpointProvider = Provider(
  (ref) {
    return CryptosEndpoint(
      Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3')),
    );
  },
);

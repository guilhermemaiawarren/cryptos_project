import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cryptos_endpoint.dart';

final cryptosEndpointProvider = Provider(
  (ref) {
    return CryptosEndpoint(
      Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3')),
    );
  },
);

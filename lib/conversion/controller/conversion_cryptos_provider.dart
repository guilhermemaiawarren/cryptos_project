import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/model/conversion_crypto_view_data.dart';
import 'package:projeto_criptos/conversion/usecase/conversion_usecase_provider.dart';

final conversionCryptosProvider = FutureProvider<List<ConversionCryptoViewData>>(
  (ref) {
    return ref.read(conversionUsecaseProvider).execute();
  },
);

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/usecase/conversion_all_cryptos_usecase.dart';
import 'package:projeto_criptos/shared/repository/cryptos_repository_provider.dart';

final conversionUsecaseProvider = Provider(
  (ref) {
    return ConversionAllCryptosUsecase(
      ref.watch(cryptosRepositoryProvider),
    );
  },
);

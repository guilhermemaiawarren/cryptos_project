import 'package:decimal/decimal.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';

class ToConversionArguments {
  final Decimal cryptoAmmount;
  final CryptoEntity crypto;
  ToConversionArguments({
    required this.cryptoAmmount,
    required this.crypto,
  });
}

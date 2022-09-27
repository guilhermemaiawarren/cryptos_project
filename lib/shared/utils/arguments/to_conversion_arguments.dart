import 'package:decimal/decimal.dart';
import '../../common_model/crypto.dart';

class ToConversionArguments {
  final Decimal cryptoAmmount;
  final CryptoEntity crypto;
  ToConversionArguments({
    required this.cryptoAmmount,
    required this.crypto,
  });
}

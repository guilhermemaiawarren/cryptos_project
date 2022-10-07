import 'package:decimal/decimal.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import '../../common_model/crypto.dart';

class ToConversionArguments {
  final Decimal cryptoAmmount;
  final CryptoEntity crypto;
  final List<CryptoViewData> data;
  ToConversionArguments({
    required this.cryptoAmmount,
    required this.crypto,
    required this.data,
  });
}

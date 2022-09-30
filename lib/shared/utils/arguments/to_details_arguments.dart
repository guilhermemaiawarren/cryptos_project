import 'package:decimal/decimal.dart';
import '../../common_model/crypto.dart';


class ToDetailsArguments {
  final CryptoEntity crypto;
  final Decimal coinAmmount;
  ToDetailsArguments({
    required this.crypto,
    required this.coinAmmount,
  });
}

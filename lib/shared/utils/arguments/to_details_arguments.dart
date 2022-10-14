import 'package:decimal/decimal.dart';
import '../../../portfolio/model/crypto_view_data.dart';


class ToDetailsArguments {
  final CryptoViewData crypto;
  final Decimal coinAmmount;
  ToDetailsArguments({
    required this.crypto,
    required this.coinAmmount,
  });
}

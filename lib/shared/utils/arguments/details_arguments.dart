import 'package:decimal/decimal.dart';
import '../../../portfolio/model/crypto_view_data.dart';

class DetailsArguments {
  final CryptoViewData crypto;
  final Decimal coinAmmount;
  DetailsArguments({
    required this.crypto,
    required this.coinAmmount,
  });
}

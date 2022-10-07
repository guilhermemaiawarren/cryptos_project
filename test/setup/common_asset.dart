import 'package:faker/faker.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

class TestAsset {
  static CryptoEntity model = CryptoEntity(
    id: '',
    symbol: '',
    name: '',
    image: Faker().image.image(),
    currentPrice: dp('250'),
    variation: 6,
  );

  static CryptoViewData cryptoViewData = CryptoViewData(
    id: '',
    symbol: '',
    name: '',
    image: Faker().image.image(),
    currentPrice: dp('250'),
    variation: 6,
  );
}

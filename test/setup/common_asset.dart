import 'package:faker/faker.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

class TestAsset {
  static CryptoEntity model = CryptoEntity(
    id: '',
    symbol: '',
    name: '',
    image: Faker().image.image(),
    currentPrice: dp('021.21'),
    variation: 6,
  );
}

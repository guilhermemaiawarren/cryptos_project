import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/logicholder/methods/conversion_methods.dart';

void main() {
  test(
      'WHEN ConversionMethods.coinRegExp recieve value THEN compare if return is correct',
      () async {
    //Method replaces other special characters with dot
    String substituteValues = ConversionMethods.coinRegExp('2432,21');

    expect(substituteValues, '2432.21');
  });

  test(
      'WHEN ConversionMethods.validCoinValue execute THEN validate if return is valid',
      () async {
    bool coinValue = ConversionMethods.validCoinValue('25');
    bool coinValue2 = ConversionMethods.validCoinValue('.2521');

    expect(coinValue, true);
    expect(coinValue2, false);
  });
}

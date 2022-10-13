import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/view/conversion_screen.dart';
import 'package:projeto_criptos/shared/templates/error_body.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load ConversionScreen THEN find ErrorBody', (WidgetTester tester) async {
    await loadPage(
        tester,
        ConversionScreen(
          coinAmmount: dp('250'),
          asset: TestAsset.model,
        ));

    await tester.pumpAndSettle();
    expect(find.byType(ErrorBody), findsWidgets);
  });
}
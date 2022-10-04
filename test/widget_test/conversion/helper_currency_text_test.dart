import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/helper_currency_text.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load HelperCurrencyText THEN identify if convertHelper equals matcher',
      (WidgetTester tester) async {
    await loadPage(tester, HelperCurrencyText(convertHelper: dp('2502.21'),));

    final text = tester.widget<HelperCurrencyText>(find.byType(HelperCurrencyText));

    expect(text.convertHelper, dp('2502.21'));
  });
}

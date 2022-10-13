import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/available_balance_container.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
      'WHEN load AvailableBalanceContainer THEN compare coinAmmount with matcher',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        AvailableBalanceContainer(
            asset: TestAsset.model, coinAmmount: dp('250.21')));

    final container = tester.widget<AvailableBalanceContainer>(
        find.byType(AvailableBalanceContainer));

    expect(container.coinAmmount, dp('250.21'));
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/review/review_page.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load ReviewPage THEN compare appBar.text with matcher',
      (tester) async {
    await loadPage(
      tester,
      ReviewPage(
        convertCoin: TestAsset.model,
        convert: dp('250'),
        recieve: dp('250'),
        recieveCoin: TestAsset.model,
        data: const [],
      ),
    );

    await tester.pumpAndSettle();

    final appBar = tester.widget<ModelAppBar>(find.byType(ModelAppBar));

    expect(appBar.text, 'Revisar');
  });
}

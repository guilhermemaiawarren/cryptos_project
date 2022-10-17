import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/review/review_page.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/utils/arguments/review_arguments.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  late ReviewArguments args;

  setUp(() {
    args = ReviewArguments(
      convert: dp('250'),
      convertCoin: TestAsset.cryptoViewData,
      data: [
        TestAsset.cryptoViewData,
        TestAsset.cryptoViewData2,
      ],
      recieve: dp('250'),
      recieveCoin: TestAsset.cryptoViewData2,
    );
  });
  testWidgets('WHEN load ReviewPage THEN compare appBar.text with matcher',
      (tester) async {
    await loadPage(
      tester,
      ReviewPage(
        arguments: args,
      ),
    );

    await tester.pumpAndSettle();

    final appBar = tester.widget<ModelAppBar>(find.byType(ModelAppBar));

    expect(appBar.text, 'Revisar');
  });
}

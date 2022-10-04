import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/details/widgets/details_screen.dart';
import 'package:projeto_criptos/shared/templates/error_body.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load ChangeDaysButtons THEN find ErrorBody',
      (WidgetTester tester) async {
    await loadPage(tester,
        DetailsScreen(coin: TestAsset.model, coinAmmount: dp('250.21')));

    await tester.pumpAndSettle();

    expect(find.byType(ErrorBody), findsOneWidget);
  });
}


import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/details/view/details_page.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load DetailsPage THEN match expected return',
      (WidgetTester tester) async {
    await loadPage(tester, DetailsPage(
      asset: TestAsset.cryptoViewData,
      coinAmmount: dp('250'),
    ));


    await tester.pumpAndSettle();

    expect(find.widgetWithText(ModelAppBar, 'Detalles'), findsOneWidget);

    expect(find.byType(DetailsScreen), findsOneWidget);

   
  });
}

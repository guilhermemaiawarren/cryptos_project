import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';
import 'package:projeto_criptos/shared/templates/warren_button.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester_override_providers.dart';

void main() {
  testWidgets('WHEN load PortfolioScreen THEN press warren button',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPageWithProvider(
          tester,
          SetupWidgetTesterOverrideProvider(
            child: DetailsScreen(
              coin: TestAsset.cryptoViewData,
              coinAmmount: dp('250'),
            ),
          ));

      await tester.pumpAndSettle();

      await tester.tap(find.byType(WarrenButton));

      await tester.pumpAndSettle();
    });
  });
}

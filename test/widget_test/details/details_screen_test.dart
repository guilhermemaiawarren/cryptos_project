
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/details/view/details_screen.dart';
import 'package:projeto_criptos/shared/templates/error_body.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load DetailsPage THEN match expected return',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(
          tester,
          DetailsScreen(
            coin: TestAsset.cryptoViewData,
            coinAmmount: dp('250'),
          ));

      await tester.pumpAndSettle();

      expect(find.byType(ErrorBody), findsOneWidget);
    });
  });
}

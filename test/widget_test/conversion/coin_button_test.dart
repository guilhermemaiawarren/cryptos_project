import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/conversion/widgets/coin_button.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load CoinButton THEN match button asset id',
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await loadPage(
            tester,
            CoinButton(
              data: const [],
              onPressed: null,
              asset: TestAsset.model,
            ),
          );

          final button =
              tester.widget<CoinButton>(find.byType(CoinButton));

          expect(button.asset.id, TestAsset.model.id);
        },
      );
    },
  );
}

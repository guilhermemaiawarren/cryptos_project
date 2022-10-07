import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/conversion/view/conversion_page.dart';
import 'package:projeto_criptos/conversion/view/conversion_screen.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  List<CryptoViewData> data = [
    TestAsset.cryptoViewData,
    TestAsset.cryptoViewData,
    TestAsset.cryptoViewData,
  ];
  testWidgets('WHEN load ConversionPage THEN find body and app bar',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(
          tester,
          ConversionPage(
            coinAmmount: dp('215'),
            asset: TestAsset.model,
            data: data,
          ));

      await tester.pumpAndSettle();

      final appBar = tester.widget<ModelAppBar>(find.byType(ModelAppBar));

      expect(appBar.text, 'Convertir');
      expect(find.byType(ConversionScreen), findsOneWidget);
    });
  });
}

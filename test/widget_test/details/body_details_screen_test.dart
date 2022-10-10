import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/conversion/widgets/coin_button.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/details/widgets/body_details_screen.dart';
import 'package:projeto_criptos/details/widgets/change_days_buttons.dart';
import 'package:projeto_criptos/details/widgets/info_column.dart';
import 'package:projeto_criptos/details/widgets/top_page_container.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';
import 'package:projeto_criptos/shared/templates/warren_button.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  BodyDetailsScreen screen = BodyDetailsScreen(
    coin: TestAsset.cryptoViewData,
    coinAmmount: dp('250'),
    data: PricesViewData(
      [
        [23, 32],
        [4232, 2121],
        [23, 32],
        [4232, 2121],
        [23, 32],
        [4232, 2121],
        [23, 32],
        [4232, 2121],
      ],
    ),
    cryptos: [
      TestAsset.cryptoViewData,
      TestAsset.cryptoViewData,
      TestAsset.cryptoViewData,
      TestAsset.cryptoViewData,
    ],
  );
  testWidgets('WHEN load BodyDetailsScreen THEN test all widgets',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, screen);

      await tester.pumpAndSettle();
      final topPageContainer =
          tester.widget<TopPageContainer>(find.byType(TopPageContainer));
      final infoColumn = tester.widget<InfoColumn>(find.byType(InfoColumn));
      final warrenButton =
          tester.widget<WarrenButton>(find.byType(WarrenButton));

      expect(find.byType(Column), findsWidgets);
      expect(topPageContainer.model, TestAsset.cryptoViewData);
      expect(find.byType(Spacer), findsWidgets);
      expect(find.byType(LineChart), findsOneWidget);
      expect(find.byType(ChangeDaysButtons), findsOneWidget);
      expect(infoColumn.coin, TestAsset.cryptoViewData);
      expect(find.byType(Padding), findsWidgets);
      expect(warrenButton.text, 'Convertir Moneda');
      expect(warrenButton.color, AppAssets.magenta);

      await tester.tap(find.byType(WarrenButton));
    });
  });
  testWidgets('WHEN load BodyDetailsScreen THEN drag graph',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, screen);

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('15')));

      await tester.drag(find.byType(LineChart), const Offset(25, 25));
      await tester.drag(find.byType(LineChart), const Offset(25, 50));
    });
  });
  testWidgets('WHEN load BodyDetailsScreen THEN press Button',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, screen);

      await tester.pumpAndSettle();

      await tester.tap(find.byType(WarrenButton));

      await tester.pumpAndSettle();

      expect(find.byType(CoinButton), findsWidgets);
    });
  });
}

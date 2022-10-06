import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
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
  testWidgets('WHEN load BodyDetailsScreen THEN test all widgets', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      BodyDetailsScreen screen = BodyDetailsScreen(
        coin: TestAsset.model,
        coinAmmount: dp('250'),
        data: PricesViewData([
          [23, 32],
          [4232, 2121],
          [23, 32],
          [4232, 2121],
          [23, 32],
          [4232, 2121],
          [23, 32],
          [4232, 2121],
        ]),
      );
      await loadPage(tester, screen);

      final topPageContainer =
          tester.widget<TopPageContainer>(find.byType(TopPageContainer));
      final infoColumn = tester.widget<InfoColumn>(find.byType(InfoColumn));
      final warrenButton =
          tester.widget<WarrenButton>(find.byType(WarrenButton));

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Column), findsWidgets);
      expect(topPageContainer.model, TestAsset.model);
      expect(find.byType(LineChart), findsOneWidget);
      expect(find.byType(ChangeDaysButtons), findsOneWidget);
      expect(infoColumn.coin, TestAsset.model);
      expect(find.byType(Padding), findsWidgets);
      expect(warrenButton.text, 'Convertir Moneda');
      expect(warrenButton.color, AppAssets.magenta);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/details/widgets/info_column.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load InfoColumn THEN return day and variation of column',
      (WidgetTester tester) async {
    await loadPage(tester, column);

    await tester.pumpAndSettle();
    final infoColumn = tester.widget<InfoColumn>(find.byType(InfoColumn));
    expect(infoColumn.day, 5);
    expect(infoColumn.variation, 5);
  });
}

InfoColumn column = InfoColumn(
  day: 5,
  variation: 5,
  coinAmmount: dp('512.21'),
  coin: TestAsset.model,
  data: _data,
);
PricesViewData _data = PricesViewData([
  [214, 2142],
  [214, 2142],
  [214, 2142],
  [214, 2142],
  [214, 2142],
  [214, 2142],
]);

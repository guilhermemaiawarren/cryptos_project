import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/total_convert_value_container.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
      'WHEN load TotalConvertValueContainer THEN find text with correspondent key',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        TotalConvertValueContainer(
            convertedCryptoHelper: dp('20.21'), cryptoConverted: TestAsset.cryptoViewData));

    final textColumn =
        tester.widget<Column>(find.byKey(const Key('EstimatedTotalColumn')));

    expect(
        textColumn.children.elementAt(0).key, const Key('EstimatedTotalText'));
  });
}

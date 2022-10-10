import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/controller/conversion_controller.dart';
import 'package:projeto_criptos/conversion/widgets/swap_icon_button.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  ConversionController controller = ConversionController();

  List<CryptoViewData> cryptos = [
    TestAsset.cryptoViewData,
    TestAsset.cryptoViewData2,
    TestAsset.cryptoViewData3,
  ];
  List<double> coinAmmountList = [25,25,25];
  setUp(() {
    controller.controllerInit(TestAsset.cryptoViewData, dp('250'), cryptos, coinAmmountList);
  });
  testWidgets('WHEN load SwapIconButton THEN find his icon key',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SwapIconButton(
          controller: ConversionController(),
        ));

    final iconButton = tester.widget<IconButton>(find.byType(IconButton));

    expect(iconButton.icon.key, const Key('SwapIcon'));
  });
  testWidgets('WHEN load SwapIconButton THEN press swapIconButton',
      (WidgetTester tester) async {
    await loadPage(
        tester,
        SwapIconButton(
          controller: controller,
        ));

  await tester.tap(find.byType(IconButton));
  });
}

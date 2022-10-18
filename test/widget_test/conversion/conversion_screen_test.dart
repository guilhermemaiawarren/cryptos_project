import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/conversion/controller/conversion_controller.dart';
import 'package:projeto_criptos/conversion/widgets/available_balance_container.dart';
import 'package:projeto_criptos/conversion/view/conversion_screen.dart';
import 'package:projeto_criptos/conversion/widgets/coin_text_field.dart';
import 'package:projeto_criptos/conversion/widgets/helper_currency_text.dart';
import 'package:projeto_criptos/conversion/widgets/informative_text.dart';
import 'package:projeto_criptos/conversion/widgets/swap_icon_button.dart';
import 'package:projeto_criptos/conversion/widgets/total_convert_value_container.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  late ConversionController controller;

  setUp(() {
    controller = ConversionController();
    controller.controllerInit(
      TestAsset.cryptoViewData,
      dp('250'),
      [
        TestAsset.cryptoViewData,
        TestAsset.cryptoViewData2,
        TestAsset.cryptoViewData3,
      ],
      [
        25,
        25,
        25,
      ],
    );
  });
  testWidgets('WHEN load ConversionScreen THEN tests attributes in all widgets',
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await loadPage(
          tester,
          ConversionScreen(
            controller: controller,
          ),
        );

        final availableContainer = tester.widget<AvailableBalanceContainer>(
            find.byType(AvailableBalanceContainer));
        final informativeText =
            tester.widget<InformativeText>(find.byType(InformativeText));
        final swapButton =
            tester.widget<SwapIconButton>(find.byType(SwapIconButton));
        final textField =
            tester.widget<CoinTextField>(find.byType(CoinTextField));
        final helperCurrency =
            tester.widget<HelperCurrencyText>(find.byType(HelperCurrencyText));
        final totalConvertValue = tester.widget<TotalConvertValueContainer>(
            find.byType(TotalConvertValueContainer));

        expect(availableContainer.asset.id, 'bitcoin');
        expect(availableContainer.coinAmmount, dp('250'));
        expect(informativeText.key, const Key('InformativeText'));
        expect(swapButton.key, const Key('SwapButton'));
        expect(textField.asset.id, 'bitcoin');
        expect(helperCurrency.convertHelper, dp('0'));
        expect(totalConvertValue.cryptoConverted.id, 'ethereum');
      },
    );
  });
}

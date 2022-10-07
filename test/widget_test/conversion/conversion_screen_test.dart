import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/conversion/widgets/available_balance_container.dart';
import 'package:projeto_criptos/conversion/view/conversion_screen.dart';
import 'package:projeto_criptos/conversion/widgets/coin_button.dart';
import 'package:projeto_criptos/conversion/widgets/coin_text_field.dart';
import 'package:projeto_criptos/conversion/widgets/helper_currency_text.dart';
import 'package:projeto_criptos/conversion/widgets/informative_text.dart';
import 'package:projeto_criptos/conversion/widgets/swap_icon_button.dart';
import 'package:projeto_criptos/conversion/widgets/total_convert_value_container.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
      'WHEN load BodyConversionScreen THEN tests attributes in all widgets',
      (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await loadPage(
          tester,
          const ConversionScreen(),
        );

        final availableContainer = tester.widget<AvailableBalanceContainer>(
            find.byType(AvailableBalanceContainer));
        final informativeText =
            tester.widget<InformativeText>(find.byType(InformativeText));
        final convertCoinButton =
            tester.widget<CoinButton>(find.byKey(const Key('ConvertAsset')));
        final swapButton =
            tester.widget<SwapIconButton>(find.byType(SwapIconButton));
        final recieveCoinButton =
            tester.widget<CoinButton>(find.byKey(const Key('RecieveAsset')));
        final textField =
            tester.widget<CoinTextField>(find.byType(CoinTextField));
        final helperCurrency =
            tester.widget<HelperCurrencyText>(find.byType(HelperCurrencyText));
        final totalConvertValue = tester.widget<TotalConvertValueContainer>(
            find.byType(TotalConvertValueContainer));

        expect(availableContainer.asset.id, TestAsset.model.id);
        expect(availableContainer.coinAmmount, dp('250'));
        expect(informativeText.key, const Key('InformativeText'));
        expect(convertCoinButton.asset.symbol, TestAsset.model.symbol);
        expect(swapButton.key, const Key('SwapButton'));
        expect(
            recieveCoinButton.asset.currentPrice, TestAsset.model.currentPrice);
        expect(textField.asset.id, TestAsset.model.id);
        expect(helperCurrency.convertHelper, dp('250'));
        expect(totalConvertValue.cryptoConverted.id, TestAsset.model.id);
      },
    );
  });
}

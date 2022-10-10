import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/conversion/controller/conversion_controller.dart';
import 'package:projeto_criptos/conversion/widgets/coin_button.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<CryptoViewData> data = [
    TestAsset.cryptoViewData,
    TestAsset.cryptoViewData2,
    TestAsset.cryptoViewData3,
  ];
  ConversionController controller = ConversionController();

  controller.controllerInit(TestAsset.cryptoViewData, dp('250'), data, [25, 25, 25, 25]);
  testWidgets(
    'WHEN load CoinButton THEN find widgets',
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await loadPage(
            tester,
            CoinButton(
              key: const Key('CoinButton'),
              controller: controller,
              formKey: formKey,
              id: '1',
              value: '250',
              asset: controller.asset,
            ),
          );

          final button = tester.widget<CoinButton>(find.byType(CoinButton));
          final materialButton =
              tester.widget<MaterialButton>(find.byType(MaterialButton));

          expect(button.key, const Key('CoinButton'));
          expect(materialButton.onPressed != null, true);

          await tester.tap(find.byType(MaterialButton));

          await tester.pump();

          expect(find.byKey(const Key('ListViewCoinButton')), findsOneWidget);
          expect(find.byKey(const Key('ColumnCoinButton')), findsWidgets);
          expect(find.byKey(const Key('DividerCoinButton')), findsWidgets);
          expect(find.byKey(const Key('SymbolCryptoCoinButton')), findsWidgets);
          expect(find.byKey(const Key('NameCryptoCoinButton')), findsWidgets);
          expect(find.byKey(const Key('IconCoinButton')), findsWidgets);
        },
      );
    },
  );
  testWidgets(
    'WHEN load CoinButton THEN change coin with id one',
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await loadPage(
            tester,
            CoinButton(
              key: const Key('CoinButton'),
              controller: controller,
              formKey: formKey,
              id: '1',
              value: '250',
              asset: controller.asset,
            ),
          );

          await tester.tap(find.byType(MaterialButton));

          await tester.pump();
          await tester.drag(find.byKey(const Key('ListViewCoinButton')),
              const Offset(400.0, 787.0));

          await tester.pumpAndSettle();

          await tester.tap(find.byKey(const Key('ethereum')));
        },
      );
    },
  );
  testWidgets(
    'WHEN load CoinButton THEN change coin with id two',
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await loadPage(
            tester,
            CoinButton(
              key: const Key('CoinButton'),
              controller: controller,
              formKey: formKey,
              id: '2',
              value: '250',
              asset: controller.cryptoConverted,
            ),
          );

          await tester.tap(find.byType(MaterialButton));

          await tester.pump();

          await tester.drag(find.byKey(const Key('ListViewCoinButton')),
              const Offset(400.0, 787.0));

          await tester.pumpAndSettle();

          await tester.tap(find.byKey(const Key('ethereum')));
        },
      );
    },
  );
}

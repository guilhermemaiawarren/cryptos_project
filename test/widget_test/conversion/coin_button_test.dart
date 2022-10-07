import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/conversion/widgets/coin_button.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<CryptoEntity> data = [TestAsset.model, TestAsset.model];

  testWidgets(
    'WHEN load CoinButton THEN match button asset id',
    (WidgetTester tester) async {
      mockNetworkImagesFor(
        () async {
          await loadPage(
            tester,
            CoinButton(
              key: const Key('CoinButton'),
              data: data,
              asset: TestAsset.model,
              formKey: formKey,
              id: '1',
              value: '250',
            ),
          );

          final button = tester.widget<CoinButton>(find.byType(CoinButton));
          final materialButton =
              tester.widget<MaterialButton>(find.byType(MaterialButton));

          expect(button.asset.id, TestAsset.model.id);
          expect(button.data[0].id, data[0].id);
          expect(button.key, const Key('CoinButton'));
          expect(materialButton.onPressed != null, true);

          await tester.tap(find.byType(MaterialButton));

          await tester.pump();

          expect(find.byKey(const Key('ListTileBottomSheet')), findsWidgets);
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
}

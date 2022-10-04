import 'package:faker/faker.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/portfolio/widgets/asset_list_tile.dart';
import 'package:projeto_criptos/portfolio/widgets/wallet_assets_list_view.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('WHEN load WalletAssetsListView THEN needs to return at least one AssetListTile',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      SizedBox(
        height: double.maxFinite,
        child: WalletAssetsListView(
          cryptosData: [
            CryptoViewData(
                id: 'id',
                symbol: 'symbol',
                name: 'name',
                image: Faker().image.image(),
                currentPrice: dp('0.0'),
                variation: 4),
          ],
        ),
      ),
    );

    expect(find.byType(AssetListTile), findsWidgets);
  });
}

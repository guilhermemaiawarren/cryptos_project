import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/portfolio/widgets/body_portfolio_screen.dart';
import 'package:projeto_criptos/portfolio/widgets/wallet_assets_list_view.dart';
import 'package:projeto_criptos/portfolio/widgets/wallet_visibility.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  late List<CryptoViewData> data;

  setUp(() {
    data = [
      TestAsset.cryptoViewData,
      TestAsset.cryptoViewData,
      TestAsset.cryptoViewData,
    ];
  });
  testWidgets('WHEN load BodyPortfolioScreen THEN match expected returns', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, BodyPortfolioScreen(data: data));

      await tester.pumpAndSettle();

      expect(find.byType(Column),findsWidgets);
      expect(find.byType(WalletVisibility),findsWidgets);
      expect(find.byType(Expanded),findsWidgets);
      expect(find.byType(WalletAssetsListView), findsWidgets);
      expect(find.byType(Text),findsWidgets);
      expect(find.byType(Divider),findsWidgets);

    });
  });
}
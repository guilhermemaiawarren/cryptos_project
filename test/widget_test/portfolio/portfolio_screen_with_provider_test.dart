import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/portfolio/view/portfolio_screen.dart';

import '../../setup/setup_widget_tester_override_providers.dart';

void main() {
  testWidgets(
      'WHEN load PortfolioScreen THEN ensure returned BodyPortfolioScreen',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPageWithProvider(tester,
          const SetupWidgetTesterOverrideProvider(child: PortfolioScreen()));

      await tester.pumpAndSettle();

      expect(find.byType(Column), findsWidgets);
    });
  });
}

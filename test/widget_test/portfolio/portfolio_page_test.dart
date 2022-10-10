import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/portfolio/view/portfolio_page.dart';
import 'package:projeto_criptos/portfolio/view/portfolio_screen.dart';
import 'package:projeto_criptos/shared/templates/custom_bottom_nav_bar.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load portfolio page THEN return PortfolioPage and CustomBottomNavBar',
    (WidgetTester tester) async {
      await loadPage(tester, const PortfolioPage());
      await tester.pumpAndSettle();
      final portfolioPage = find.byType(PortfolioScreen);
      final customBottomNavBar = find.byType(CustomBottomNavBar);
      expect(customBottomNavBar, findsOneWidget);
      expect(portfolioPage, findsOneWidget);
    },
  );
  testWidgets(
    'WHEN load portfolio page THEN navigate to moves THEN navigate to Portfolio',
    (WidgetTester tester) async {
      await loadPage(tester, const PortfolioPage());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Movimientos'));

      await tester.pumpAndSettle();

      await tester.tap(find.text('Portafolio'));

      await tester.pumpAndSettle();
    },
  );
}

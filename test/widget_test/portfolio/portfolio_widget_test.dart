import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/portfolio/view/portfolio_page.dart';
import 'package:projeto_criptos/shared/templates/custom_bottom_nav_bar.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load portfolio page ENSURE return PortfolioPage and CustomBottomNavBar',
    (WidgetTester tester) async {
      //Arrange
      await loadPage(tester, const PortfolioPage());
      //Action
      await tester.pumpAndSettle();
      final portfolioPage = find.byType(PortfolioPage);
      final customBottomNavBar = find.byType(CustomBottomNavBar);
      //Assert
      expect(customBottomNavBar, findsOneWidget);
      expect(portfolioPage, findsOneWidget);
    },
  );
}

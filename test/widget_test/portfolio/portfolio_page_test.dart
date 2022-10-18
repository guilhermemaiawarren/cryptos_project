import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/movements/view/moves_screen.dart';
import 'package:projeto_criptos/portfolio/view/portfolio_page.dart';
import 'package:projeto_criptos/portfolio/view/portfolio_screen.dart';
import 'package:projeto_criptos/shared/templates/custom_bottom_nav_bar.dart';
import 'package:projeto_criptos/shared/templates/error_body.dart';
import 'package:projeto_criptos/shared/templates/warren_button.dart';

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
    'WHEN load portfolio page THEN navigate to moves THEN press refresh button',
    (WidgetTester tester) async {
      await loadPage(tester, const PortfolioPage());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Movimientos'));

      await tester.pumpAndSettle();

      expect(find.byType(MovesScreen), findsWidgets);

      await tester.tap(find.text('Portafolio'));

      await tester.pumpAndSettle(const Duration(seconds: 4));

      expect(find.byType(ErrorBody), findsWidgets);

      await tester.tap(find.byType(WarrenButton));

      await tester.pumpAndSettle();
    },
  );
}

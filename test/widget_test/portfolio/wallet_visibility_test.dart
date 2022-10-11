import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/portfolio/widgets/wallet_visibility.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
    'WHEN load WalletVisibility ENSURE return an IconButton with visibility',
    (WidgetTester tester) async {
      await loadPage(tester, const WalletVisibility());
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.visibility), findsNothing);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    },
  );
  testWidgets(
    'WHEN load WalletVisibility ENSURE return an Text in spanish',
    (WidgetTester tester) async {
      await loadPage(tester, const WalletVisibility());
      await tester.pumpAndSettle();
      final helperText = tester.widget<Text>(find.byType(Text).last);
      expect(helperText.data, 'Valor total de la moneda');
    },
  );
}

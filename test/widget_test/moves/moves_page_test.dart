import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/moves/view/moves_page.dart';
import 'package:projeto_criptos/moves/view/moves_screen.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load MovesPage THEN return MovesScreen and not found BottomNavBar key', (WidgetTester tester) async {
    await loadPage(tester, const MovesPage());

    await tester.pumpAndSettle();

    expect(find.byType(MovesScreen), findsOneWidget);
    expect(find.byKey(const Key('MovesScreenBottomNavBar')), findsNothing);
  });
}

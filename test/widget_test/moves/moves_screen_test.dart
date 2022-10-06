import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/movements/view/moves_screen.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load MovesScreen THEN return widgets by keys', (WidgetTester tester) async {
    await loadPage(tester, const MovesScreen());

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('Movimentações')), findsOneWidget);
    expect(find.byKey(const Key('MovesScreenBody')), findsOneWidget);
  });
}

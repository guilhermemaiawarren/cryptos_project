import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/floating_cripto_button.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load FloatingCriptoButton THEN identify if background colors equals grey',
      (WidgetTester tester) async {
    await loadPage(tester, const FloatingCriptoButton());

    final button = tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));

    expect(button.backgroundColor, Colors.grey);
  });
}
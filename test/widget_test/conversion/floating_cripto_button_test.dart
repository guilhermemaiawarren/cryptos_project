import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/floating_cripto_button.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
      'WHEN load FloatingCriptoButton THEN compare if background color and key match',
      (WidgetTester tester) async {
    await loadPage(tester, const FloatingCriptoButton());

    final button =tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
    final icon =tester.widget<Icon>(find.byType(Icon));


    expect(icon.icon, Icons.keyboard_arrow_right);
    expect(icon.key, const Key('FloatingIconKey'));
    expect(button.backgroundColor, Colors.grey);
    expect(button.child!.key, const Key('FloatingIconKey'));
  });
}

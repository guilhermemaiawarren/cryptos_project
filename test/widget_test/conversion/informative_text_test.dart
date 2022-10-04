import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/informative_text.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load InformativeText THEN identify the text',
      (WidgetTester tester) async {
    await loadPage(tester, const InformativeText());

    final text = tester.widget<Text>(find.byType(Text));

    expect(text.data, '¿Cuánto te gustaría convertir?');
  });
}

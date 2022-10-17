import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/review/success_conversion_page.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
      'WHEN load SucessConversionPage THEN match atributes with object with key',
      (tester) async {
    await loadPage(tester, const SucessConversionPage());

    await tester.pumpAndSettle(const Duration(milliseconds: 2000));

    final animatedContainer = tester
        .widget<AnimatedContainer>(find.byKey(const Key('AnimatedContainer')));

    expect(animatedContainer.curve, Curves.easeIn);
    expect(animatedContainer.duration, const Duration(seconds: 2));
  });
  testWidgets('WHEN load SucessConversionPage THEN go to moves',
      (tester) async {
    await loadPage(tester, const SucessConversionPage());

    await tester.pumpAndSettle(const Duration(milliseconds: 2000));

    await tester.tap(find.byType(IconButton));
  });
}

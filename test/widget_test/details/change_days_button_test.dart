import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/details/widgets/change_day_button.dart';
import 'package:projeto_criptos/details/widgets/change_days_buttons.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets(
      'WHEN load ChangeDaysButtons THEN look for scroll direction in ListView',
      (WidgetTester tester) async {
    await loadPage(tester, const ChangeDaysButtons());

    final listView = tester.widget<ListView>(find.byType(ListView));

    expect(listView.scrollDirection, Axis.horizontal);
  });
  testWidgets('WHEN load ChangeDaysButtons THEN tap button with Key 15',
      (WidgetTester tester) async {
    await loadPage(tester, const ChangeDaysButtons());

    final dayButton =
        tester.widget<ChangeDayButton>(find.byKey(const Key('5')));

    expect(dayButton.days, 5);

    await tester.tap(find.byKey(const Key('15')));
  });
}

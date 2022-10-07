import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/details/widgets/change_day_button.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load ChangeDaysButtons THEN find GestureDetector',
      (WidgetTester tester) async {
    await loadPage(tester, const ChangeDayButton(days: 5));
    expect(find.byType(GestureDetector), findsOneWidget);
  });
  testWidgets('WHEN load ChangeDaysButtons THEN find Container and his child key',
      (WidgetTester tester) async {
    await loadPage(tester, const ChangeDayButton(days: 5));
    final container = tester
        .widget<Container>(find.byKey(const Key('ContainerChangeDaysButton')));
    expect(container.child!.key, const Key('TextChangeDaysButton'));
    expect(find.byKey(const Key('GestureDetectorChangeDayButton')), findsOneWidget);
  });
}

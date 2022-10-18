import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/portfolio/widgets/visibility_off_container.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load VisibilityOffContainer THEN find its dimensions',
      (WidgetTester tester) async {
    await loadPage(
        tester, const VisibilityOffContainer(witdh: 50, height: 100));

    await tester.pumpAndSettle();

    final container = tester
        .widget<VisibilityOffContainer>(find.byType(VisibilityOffContainer));

    expect(container.height, 100);
    expect(container.witdh, 50);
  });
}

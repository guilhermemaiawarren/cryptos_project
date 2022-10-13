import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/swap_icon_button.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load SwapIconButton THEN find his icon key',
      (WidgetTester tester) async {
    await loadPage(tester, SwapIconButton(onPressed: () {}));

    final iconButton = tester.widget<IconButton>(find.byType(IconButton));

    expect(iconButton.icon.key, const Key('SwapIcon'));
  });
}

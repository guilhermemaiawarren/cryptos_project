import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/review/widgets/review_buttons.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';
import 'package:projeto_criptos/shared/templates/warren_button.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load ReviewButtons THEN find BackButton colors',
      (tester) async {
    await loadPage(tester, const ReviewButtons(onPressed: null));

    final button =
        tester.widget<WarrenButton>(find.byKey(const Key('BackButton')));

    expect(button.textColor, AppAssets.magenta);
    expect(button.color, Colors.white);
  });
  testWidgets('WHEN load ReviewButtons THEN find PushButton color',
      (tester) async {
    await loadPage(tester, const ReviewButtons(onPressed: null));

    final button =
        tester.widget<WarrenButton>(find.byKey(const Key('PushButton')));

    expect(button.color, AppAssets.magenta);
  });
}

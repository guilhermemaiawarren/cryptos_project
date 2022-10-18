import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/review/widgets/review_buttons.dart';
import 'package:projeto_criptos/shared/common_model/move_model.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';
import 'package:projeto_criptos/shared/templates/warren_button.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load ReviewButtons THEN find BackButton colors',
      (tester) async {
    await loadPage(
        tester,
        ReviewButtons(
          convert: dp('250'),
          recieve: dp('250'),
          convertId: 2,
          move: _moveModel,
          recieveId: 5,
        ));

    final button =
        tester.widget<WarrenButton>(find.byKey(const Key('BackButton')));

    expect(button.textColor, AppAssets.magenta);
    expect(button.color, Colors.white);
  });
  testWidgets('WHEN load ReviewButtons THEN press PushButton color',
      (tester) async {
    await loadPage(
        tester,
        ReviewButtons(
          convert: dp('250'),
          recieve: dp('250'),
          convertId: 2,
          move: _moveModel,
          recieveId: 5,
        ));

    final button =
        tester.widget<WarrenButton>(find.byKey(const Key('PushButton')));

    expect(button.color, AppAssets.magenta);

    await tester.tap(find.byKey(const Key('PushButton')));

    await tester.pumpAndSettle(const Duration(seconds: 2));
  });
}

MoveModel _moveModel = MoveModel(
  convert: dp('250'),
  recieve: dp('250'),
  data: DateTime.now(),
  cashHelper: dp('250'),
  convertCoinId: 'bitcoin',
  recieveCoinId: 'ethereum',
);

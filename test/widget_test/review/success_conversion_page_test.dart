import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/review/success_conversion_page.dart';
import 'package:projeto_criptos/shared/common_model/move_model.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load SucessConversionPage THEN match atributes with object with key',
      (tester) async {
    await loadPage(tester, SucessConversionPage(move: _model));

    await tester.pumpAndSettle(const Duration(milliseconds: 2000));

    final animatedContainer = tester.widget<AnimatedContainer>(find.byKey(const Key('AnimatedContainer')));

    expect(animatedContainer.curve, Curves.easeIn);
    expect(animatedContainer.duration, const Duration(seconds: 2));
  });
}

MoveModel _model = MoveModel(
  convert: dp('250.21'),
  recieve: dp('972.12'),
  data: DateTime.now(),
  cashHelper: dp('0.412'),
  convertCoinId: 'bitcoin',
  recieveCoinId: 'ethereum',
);

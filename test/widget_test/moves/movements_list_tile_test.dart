
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/movements/widgets/movements_list_tile.dart';
import 'package:projeto_criptos/shared/common_model/move_model.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load MovementListTile THEN return widgets by key', (WidgetTester tester) async {
    await loadPage(tester, MovementListTile(model: _model));

    await tester.pumpAndSettle();

    expect(find.byKey(const Key('Convert')), findsOneWidget);
    expect(find.byKey(const Key('Recieve')), findsNothing);
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

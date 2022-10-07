import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/conversion/widgets/coin_text_field.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  late TextEditingController coinTextFieldController;
  setUp(() {
    coinTextFieldController = TextEditingController();
  });
  testWidgets('WHEN load CoinTextField THEN find match expected returns',
      (WidgetTester tester) async {
    await loadPage(
      tester,
      CoinTextField(
        controller: coinTextFieldController,
        asset: TestAsset.model,
        formKey: GlobalKey<FormState>(),
      ),
    );

    final textField = tester.widget<CoinTextField>(find.byType(CoinTextField));

    expect(textField.validator, null);
    expect(textField.onChanged, null);
    expect(textField.asset, TestAsset.model);
    expect(textField.controller, coinTextFieldController);

  });
}

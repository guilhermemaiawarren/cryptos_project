import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/details/widgets/details_screen.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load ChangeDaysButtons THEN find text',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester,
          DetailsScreen(coin: TestAsset.model, coinAmmount: dp('250.21')));

      await tester.pumpAndSettle();

      expect(find.byType(Text), findsWidgets);
    });
  });
}

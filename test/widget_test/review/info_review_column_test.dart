import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/review/widgets/info_review_column.dart';

import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load InfoReviewColumn THEN compare convert atributte',
      (tester) async {
    await loadPage(
        tester,
        const InfoReviewColumn(
          convert: '2 BTC',
          recieve: '27.521 ETH',
          cambio: '1 BTC = 14 ETH',
        ));

    final infoColumn =
        tester.widget<InfoReviewColumn>(find.byType(InfoReviewColumn));

    expect(infoColumn.convert, '2 BTC');
  });
}

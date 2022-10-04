import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_criptos/details/widgets/top_page_container.dart';

import '../../setup/common_asset.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load TopPageContainer THEN return if there is a widget',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, TopPageContainer(model: TestAsset.model));

      await tester.pumpAndSettle();

      expect(find.byType(TopPageContainer), findsOneWidget);
    });
  });
}

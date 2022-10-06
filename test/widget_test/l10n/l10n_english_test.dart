import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../setup/setup_l10n_tester.dart';

void main() {
  testWidgets('WHEN load L10nWidgetTester THEN test english texts', (WidgetTester tester) async {
    await loadl10n(tester, const L10nWidgetTester(locale: Locale('en', '')));

    expect(find.text('Portfolio'), findsOneWidget);
    expect(find.text('Moves'), findsOneWidget);
    expect(find.text('Crypto'), findsOneWidget);
    expect(find.text('Total crypto wealth'), findsOneWidget);
    expect(find.text('Details'), findsOneWidget);
    expect(find.text('Ammount'), findsOneWidget);
    expect(find.text('Price'), findsOneWidget);
    expect(find.text('Variation'), findsOneWidget);
    expect(find.text('Value'), findsOneWidget);
    expect(find.text('Convert Crypto'), findsOneWidget);
    expect(find.text('Convert'), findsOneWidget);
    expect(find.text('Available Balance'), findsOneWidget);
    expect(find.text('How much would you like to convert?'), findsOneWidget);
    expect(find.text('Value must be more than zero'), findsOneWidget);
    expect(find.text("The first character can't be special"), findsOneWidget);
    expect(find.text('Insufficient Funds'), findsOneWidget);
    expect(find.text('Estimated Total'), findsOneWidget);
    expect(find.text('Review'), findsOneWidget);
    expect(find.text('Review your conversion data'), findsOneWidget);
    expect(find.text('Exchange'), findsOneWidget);
    expect(find.text('Recieve'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Conclude'), findsOneWidget);
    expect(find.text('Conversion performed'), findsOneWidget);
    expect(find.text('Currency conversion successful!'), findsOneWidget);
    expect(find.text('Ops! An error has occurred'), findsOneWidget);
    expect(find.text('Try Again'), findsOneWidget);
  });
}

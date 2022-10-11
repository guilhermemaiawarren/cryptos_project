import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';


void main() {
  test('WHEN load L10nWidgetTester THEN test english texts', () async {

    expect(() => lookupCoreStrings(const Locale('rs')), throwsFlutterError);
  });
}

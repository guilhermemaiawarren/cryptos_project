import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';

void main() {
  test('WHEN execute lookupCoreStrings THEN identify displayed exception',
      () async {
    expect(() => lookupCoreStrings(const Locale('rs')), throwsFlutterError);
  });
}

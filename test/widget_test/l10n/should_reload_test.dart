import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';

void main() {
  test('WHEN execute should reload THEN ensure return is false', () async {
    expect(CoreStrings.delegate.shouldReload.call(CoreStrings.delegate), false);
  });
}

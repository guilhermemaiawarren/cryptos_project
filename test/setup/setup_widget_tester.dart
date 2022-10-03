import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWidgetTester({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        localizationsDelegates: const [
          CoreStrings.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        locale: const Locale('es',''),
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', 'BR'),
          Locale('es', ''),
        ],
        home: Material(
          child: child,
        ),
      ),
    );
  }
}


Future<void> loadPage(WidgetTester tester, Widget child) async {
    var page = SetupWidgetTester(
      child: child,
    );
    await tester.pumpWidget(page);
  }
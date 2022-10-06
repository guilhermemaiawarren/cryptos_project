import 'package:flutter/material.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/shared/theme/theme_data_criptos.dart';
import 'route_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        CoreStrings.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('pt', 'BR'),
        Locale('es', ''),
      ],
      onGenerateRoute: RouteController.generateRoute,
      initialRoute: '/portfolio',
      debugShowCheckedModeBanner: false,
      theme: themeDataCriptos(),
    );
  }
}

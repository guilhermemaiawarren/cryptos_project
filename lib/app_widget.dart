import 'package:flutter/material.dart';
import 'l10n/core_strings.dart';
import 'shared/theme/theme_data_criptos.dart';
import 'route_controller.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: CoreStrings.localizationsDelegates,
      supportedLocales: CoreStrings.supportedLocales,
      onGenerateRoute: RouteController.generateRoute,
      initialRoute: '/portfolio',
      debugShowCheckedModeBanner: false,
      theme: themeDataCriptos(),
    );
  }
}

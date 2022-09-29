import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:projeto_criptos/shared/theme/theme_data_criptos.dart';

import 'route_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      onGenerateRoute: RouteController.generateRoute,
      initialRoute: '/portfolio',
      debugShowCheckedModeBanner: false,
      theme: themeDataCriptos(),
    );
  }
}

import 'package:flutter/material.dart';

import 'shared/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

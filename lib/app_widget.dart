import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:projeto_criptos/src/presenter/screens/wallet/wallet_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const WalletScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

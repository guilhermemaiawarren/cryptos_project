import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_widget.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder:(context) => const ProviderScope(
        child: AppWidget(),
      ),
    ),
  );
}

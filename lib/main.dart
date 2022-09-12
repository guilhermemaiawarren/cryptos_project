import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_widget.dart';

// void main() {
//   runApp(DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) {
//         return const ProviderScope(child: MyApp());
//       }));
// }

void main() {
  runApp(const ProviderScope(child: AppWidget()));
}

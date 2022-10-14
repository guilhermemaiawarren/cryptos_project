import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/conversion_controller.dart';

var convertControllerProvider = ChangeNotifierProvider((ref) => ConversionController());
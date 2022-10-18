import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/conversion_controller.dart';

var convertControllerProvider =
    ChangeNotifierProvider((ref) => ConversionController());

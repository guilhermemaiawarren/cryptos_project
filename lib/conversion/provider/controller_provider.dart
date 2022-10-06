import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/controller/conversion_controller.dart';

var convertControllerProvider = ChangeNotifierProvider((ref) => ConversionController());
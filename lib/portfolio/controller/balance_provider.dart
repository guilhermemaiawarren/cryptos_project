import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

var balanceProvider = StateProvider((ref) => dp('0.0'));
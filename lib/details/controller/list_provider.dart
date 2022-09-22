import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';

var listProvider = StateProvider<PricesViewData>((ref) => PricesViewData([]));
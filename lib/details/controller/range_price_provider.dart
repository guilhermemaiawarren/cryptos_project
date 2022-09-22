import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';

var rangePriceProvider = StateNotifierProvider<RangeNotifier, double>((ref) => RangeNotifier());

class RangeNotifier extends StateNotifier<double> {
  RangeNotifier() : super(0.0);

  Future<void> changePriceByRange(PricesViewData lista) async{
    state = lista.prices.first.last.toDouble();
  }
}
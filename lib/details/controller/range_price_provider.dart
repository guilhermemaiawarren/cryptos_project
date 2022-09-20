import 'package:hooks_riverpod/hooks_riverpod.dart';

var rangePriceProvider = StateNotifierProvider<RangeNotifier, double>((ref) => RangeNotifier());

class RangeNotifier extends StateNotifier<double> {
  RangeNotifier() : super(0.0);

  Future<void> changePriceByRange(List<double> lista) async{
    state = lista.first;
  }
}
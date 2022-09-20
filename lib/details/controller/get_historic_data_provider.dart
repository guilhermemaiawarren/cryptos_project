import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/data/datasources/remote_data/get_historic_data_datasource_impl.dart';
import 'package:projeto_criptos/details/repository/get_historic_data_repository.dart';
import 'package:projeto_criptos/details/usecase/get_historic_data_usecase.dart';

final _dioProvider = Provider((ref) => Dio());

final _datasourceProvider = Provider(
  (ref) => GetHistoricDataDatasourceImpl(
    ref.watch(_dioProvider),
  ),
);

final _repositoryProvider = Provider(
  (ref) => GetHistoricDataRepositoryImpl(
    ref.watch(_datasourceProvider),
  ),
);

final _usecaseProvider = Provider(
  (ref) => GetHistoricDataUsecaseImpl(
    ref.watch(_repositoryProvider),
  ),
);

var getHistoricDataProvider =
    StateNotifierProvider<GetHistoricDataNotifier, List<double>>(
  (ref) => GetHistoricDataNotifier(ref.watch(_usecaseProvider)),
);

class GetHistoricDataNotifier extends StateNotifier<List<double>> {
  GetHistoricDataNotifier(this._usecase) : super([]);

  final IGetHistoricDataUsecase _usecase;

  Future<void> getHistoricData(String moeda, int tempo) async {
    state = await _usecase.getMarketData(moeda, tempo);
  }
}

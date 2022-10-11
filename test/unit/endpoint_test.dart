
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_criptos/details/usecase/prices_usecase.dart';
import 'package:projeto_criptos/portfolio/usecase/cryptos_usecase.dart';
import 'package:projeto_criptos/shared/api/cryptos_endpoint.dart';
import 'package:projeto_criptos/shared/repository/cryptos_repository.dart';

import '../setup/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late DioMock dioMock;
  late CryptosEndpoint endpoint;
  late CryptosRepository repository;
  late CryptosUsecase usecase;
  late PricesUsecase pricesUsecase;
  setUp(() {
    dioMock = DioMock();
    endpoint = CryptosEndpoint(dioMock);
    repository = CryptosRepository(endpoint);
    usecase = CryptosUsecase(repository);
    pricesUsecase = PricesUsecase(repository);
  });

  test('WHEN getAllCryptos THEN ensure mocktail object made request', () async {
    //Arrange
    when(() => dioMock.get(any())).thenAnswer(
      (_) async => Response(
        data: ApiFactory.getAllCryptos(),
        requestOptions: RequestOptions(path: ''),
      ),
    );
    //Action
    final list = await usecase.execute();
    //Assert
    verify(() => dioMock.get(any()));
    expect(list.isNotEmpty, true);
  });
  test('WHEN getCryptoPrices THEN ensure marketData is mockedData', () async {
    //Arrange
    when(() => dioMock.get(any())).thenAnswer(
      (_) async => Response(
        data: ApiFactory.getPricesData('id'),
        requestOptions: RequestOptions(path: ''),
      ),
    );
    //Action
    final list = await pricesUsecase.getPrices('eth');

    //Assert
    verify(() => dioMock.get(any())).called(1);
    expect(list.prices.isNotEmpty, true);
  });
}

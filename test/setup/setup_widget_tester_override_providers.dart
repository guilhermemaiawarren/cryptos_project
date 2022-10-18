import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_criptos/details/model/prices_view_data.dart';
import 'package:projeto_criptos/details/provider/historic_data_provider.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/portfolio/provider/cryptos_provider.dart';
import 'package:projeto_criptos/route_controller.dart';
import 'package:projeto_criptos/shared/theme/theme_data_criptos.dart';

import 'fake_repository.dart';

class SetupWidgetTesterOverrideProvider extends StatelessWidget {
  final Widget child;
  const SetupWidgetTesterOverrideProvider({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final overrideCryptosProvider =
        FutureProvider.autoDispose<List<CryptoViewData>>((ref) async {
      return await FakeDataRepository.getAllCryptos();
    });
    final overrideHistoricDataProvider =
        FutureProvider.family<PricesViewData, String>((ref, id) async {
      return await FakeDataRepository.getPricesData(id);
    });
    return ProviderScope(
      overrides: [
        cryptosProvider.overrideWithProvider(overrideCryptosProvider),
        historicDataProvider.overrideWithProvider(
            (argument) => overrideHistoricDataProvider(argument))
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          CoreStrings.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        locale: const Locale('es', ''),
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', 'BR'),
          Locale('es', ''),
        ],
        home: MediaQuery(
          data: const MediaQueryData(),
          child: Material(
            child: child,
          ),
        ),
        theme: themeDataCriptos(),
        onGenerateRoute: RouteController.generateRoute,
      ),
    );
  }
}

Future<void> loadPageWithProvider(WidgetTester tester, Widget child) async {
  var page = SetupWidgetTesterOverrideProvider(
    child: child,
  );
  await tester.pumpWidget(page);
}

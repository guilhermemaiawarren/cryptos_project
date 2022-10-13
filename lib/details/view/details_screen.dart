import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../conversion/view/conversion_page.dart';
import '../../l10n/core_strings.dart';
import '../../shared/templates/app_assets.dart';
import '../../shared/templates/warren_button.dart';
import '../../shared/user/user_coin_ammount_provider.dart';
import '../../shared/utils/arguments/to_conversion_arguments.dart';
import '../provider/days_provider.dart';
import '../../portfolio/provider/cryptos_provider.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../provider/historic_data_provider.dart';
import '../widgets/change_days_buttons.dart';
import '../widgets/graph_details.dart';
import '../widgets/info_column.dart';
import '../widgets/top_page_container.dart';

class DetailsScreen extends HookConsumerWidget {
  const DetailsScreen({
    super.key,
    required this.coin,
    required this.coinAmmount,
  });
  final CryptoViewData coin;
  final Decimal coinAmmount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);
    final cryptoData = ref.watch(historicDataProvider(coin.id));

    return cryptoData.when(
      data: (data) {
        int day = ref.watch(daysProvider.state).state;
        double variation =
            (data.prices.last.last / data.prices.reversed.elementAt(day).last -
                    1) *
                100;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            TopPageContainer(
              model: coin,
            ),
            const Spacer(),
            GraphDetails(
              historyCoinData: List<FlSpot>.from(
                data.prices.reversed.map(
                  (crypto) {
                    return FlSpot(
                      crypto[0].toDouble(),
                      crypto[1].toDouble(),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            const ChangeDaysButtons(),
            const Spacer(),
            InfoColumn(
              day: day,
              variation: variation,
              coinAmmount: coinAmmount,
              coin: coin,
              data: data,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: WarrenButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ConversionPage.route,
                    arguments: ToConversionArguments(
                      cryptoAmmount: coinAmmount,
                      crypto: coin,
                      data: cryptos.asData!.value,
                      coinAmmountList: ref.read(userCoinAmmountProvider),
                    ),
                  );
                },
                text: CoreStrings.of(context)!.convertCoin,
                color: AppAssets.magenta,
              ),
            ),
            const Spacer(),
          ],
        );
      },
      error: (e, r) {
        return ErrorBody(
          onRetry: () {
            ref.refresh(historicDataProvider(coin.id));
          },
        );
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }
}

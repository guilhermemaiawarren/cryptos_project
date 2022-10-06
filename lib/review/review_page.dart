import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/shared/user/movements_provider.dart';
import 'package:projeto_criptos/portfolio/controller/cryptos_provider.dart';
import 'package:projeto_criptos/review/widgets/info_review_column.dart';

import 'widgets/review_buttons.dart';
import '../shared/common_model/crypto.dart';
import '../shared/templates/model_app_bar.dart';
import '../shared/user/user_coin_ammount_provider.dart';
import '../shared/utils/decimal_to_double.dart';

import '../shared/common_model/move_model.dart';

class RevisionPage extends ConsumerStatefulWidget {
  const RevisionPage({
    Key? key,
    required this.convert,
    required this.recieve,
    required this.convertCoin,
    required this.recieveCoin,
  }) : super(key: key);
  static const route = '/revision';
  final Decimal convert;
  final Decimal recieve;
  final CryptoEntity convertCoin;
  final CryptoEntity recieveCoin;

  @override
  ConsumerState<RevisionPage> createState() => _$RevisionPageState();
}

class _$RevisionPageState extends ConsumerState<RevisionPage> {
  String getExchange() {
    double exchange = dtd(widget.convertCoin.currentPrice) /
        dtd(widget.recieveCoin.currentPrice);
    return '1 ${widget.convertCoin.symbol.toUpperCase()} = ${exchange.toStringAsFixed(7)} ${widget.recieveCoin.symbol.toUpperCase()}';
  }

  late MoveModel moves;

  @override
  Widget build(BuildContext context) {
    final cryptos = ref.watch(cryptosProvider);
    moves = MoveModel(
      convert: widget.convert,
      recieve: widget.recieve,
      data: DateTime.now(),
      cashHelper: widget.recieve * widget.recieveCoin.currentPrice,
      convertCoinId: widget.convertCoin.symbol,
      recieveCoinId: widget.recieveCoin.symbol,
    );
    return Scaffold(
      appBar: ModelAppBar(text: CoreStrings.of(context)!.review),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              CoreStrings.of(context)!.reviewText,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            InfoReviewColumn(
              convert:
                  '${widget.convert.toString()} ${widget.convertCoin.symbol.toUpperCase()}',
              recieve:
                  '${widget.recieve.toStringAsFixed(6)} ${widget.recieveCoin.symbol.toUpperCase()}',
              cambio: getExchange(),
            ),
            ReviewButtons(
              onPressed: () {
                int convertedId = cryptos.asData!.value
                    .indexWhere((crypto) => crypto.id == widget.convertCoin.id);

                int recieveId = cryptos.asData!.value
                    .indexWhere((crypto) => crypto.id == widget.recieveCoin.id);
                setState(() {
                  ref.read(userCoinAmmountProvider)[convertedId] -=
                      dtd(widget.convert);
                  ref.read(userCoinAmmountProvider)[recieveId] +=
                      dtd(widget.recieve);
                  ref.read(movementsProvider.state).state.add(moves);
                });
                Navigator.pushReplacementNamed(
                  context,
                  '/success',
                  arguments: moves,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

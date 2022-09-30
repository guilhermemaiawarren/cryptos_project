import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/moves/controller/movements_provider.dart';
import 'package:projeto_criptos/moves/model/movement_model.dart';
import 'package:projeto_criptos/portfolio/controller/cryptos_provider.dart';
import 'package:projeto_criptos/review/model/moves_model.dart';
import 'package:projeto_criptos/review/widgets/info_review_column.dart';

import 'package:projeto_criptos/review/widgets/review_buttons.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import 'package:projeto_criptos/shared/templates/error_body.dart';
import 'package:projeto_criptos/shared/templates/loading_body.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/user/user_coin_ammount_provider.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';

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

  late MovesModel moves;

  @override
  Widget build(BuildContext context) {
    final cryptos = ref.watch(cryptosProvider);
    moves = MovesModel(
      convert: widget.convert,
      recieve: widget.recieve,
      data: DateTime.now(),
      cashHelper: widget.recieve * widget.recieveCoin.currentPrice,
      convertCoinId: widget.convertCoin.symbol,
      recieveCoinId: widget.recieveCoin.symbol,
    );
    return cryptos.when(data: (data) {
      return Scaffold(
        appBar: const ModelAppBar(text: 'Revisar'),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Revise os dados da sua conversão',
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
                  int convertedId = data.indexWhere(
                      (crypto) => crypto.id == widget.convertCoin.id);
                  int recieveId = data.indexWhere(
                      (crypto) => crypto.id == widget.recieveCoin.id);
                  setState(() {
                    ref
                        .read(userCoinAmmountProvider.notifier)
                        .state[convertedId] -= dtd(widget.convert);
                    ref
                        .read(userCoinAmmountProvider.notifier)
                        .state[recieveId] += dtd(widget.recieve);
                    ref
                        .read(movementsProvider.state)
                        .state
                        .add(MovementModel.fromMap(moves.toMap()));
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
    }, error: (e, r) {
      return ErrorBody(
        onError: () {
          ref.refresh(cryptosProvider);
        },
      );
    }, loading: () {
      return const LoadingBody();
    });
  }
}

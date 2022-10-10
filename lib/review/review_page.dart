import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/review/widgets/info_review_column.dart';

import '../portfolio/model/crypto_view_data.dart';
import 'widgets/review_buttons.dart';
import '../shared/common_model/crypto.dart';
import '../shared/templates/model_app_bar.dart';
import '../shared/utils/decimal_to_double.dart';

import '../shared/common_model/move_model.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage({
    Key? key,
    required this.convert,
    required this.recieve,
    required this.convertCoin,
    required this.recieveCoin,
    required this.data,
  }) : super(key: key);
  static const route = '/revision';
  final Decimal convert;
  final Decimal recieve;
  final CryptoEntity convertCoin;
  final CryptoEntity recieveCoin;
  final List<CryptoViewData> data;

  @override
  ConsumerState<ReviewPage> createState() => _$ReviewPageState();
}

class _$ReviewPageState extends ConsumerState<ReviewPage> {
  String getExchange() {
    double exchange = dtd(widget.convertCoin.currentPrice) /
        dtd(widget.recieveCoin.currentPrice);
    return '1 ${widget.convertCoin.symbol.toUpperCase()} = ${exchange.toStringAsFixed(4)} ${widget.recieveCoin.symbol.toUpperCase()}';
  }

  late MoveModel moves;

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: InfoReviewColumn(
                convert:
                    '${widget.convert.toString()} ${widget.convertCoin.symbol.toUpperCase()}',
                recieve:
                    '${widget.recieve.toStringAsFixed(5)} ${widget.recieveCoin.symbol.toUpperCase()}',
                cambio: getExchange(),
              ),
            ),
            ReviewButtons(
              convertId: widget.data
                  .indexWhere((crypto) => crypto.id == widget.convertCoin.id),
              recieveId: widget.data
                  .indexWhere((crypto) => crypto.id == widget.recieveCoin.id),
              convert: widget.convert,
              recieve: widget.recieve,
              move: moves,
            ),
          ],
        ),
      ),
    );
  }
}

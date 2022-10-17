import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/utils/arguments/review_arguments.dart';
import '../l10n/core_strings.dart';
import 'widgets/info_review_column.dart';

import 'widgets/review_buttons.dart';
import '../shared/templates/model_app_bar.dart';
import '../shared/utils/decimal_to_double.dart';

import '../shared/common_model/move_model.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);
  static const route = '/revision';

  final ReviewArguments arguments;

  @override
  ConsumerState<ReviewPage> createState() => _$ReviewPageState();
}

class _$ReviewPageState extends ConsumerState<ReviewPage> {
  String getExchange() {
    double exchange = dtd(widget.arguments.convertCoin.currentPrice) /
        dtd(widget.arguments.recieveCoin.currentPrice);
    return '1 ${widget.arguments.convertCoin.symbol.toUpperCase()} = ${exchange.toStringAsFixed(4)} ${widget.arguments.recieveCoin.symbol.toUpperCase()}';
  }

  late MoveModel moves;

  @override
  Widget build(BuildContext context) {
    moves = MoveModel(
      convert: widget.arguments.convert,
      recieve: widget.arguments.recieve,
      data: DateTime.now(),
      cashHelper: widget.arguments.recieve * widget.arguments.recieveCoin.currentPrice,
      convertCoinId: widget.arguments.convertCoin.symbol,
      recieveCoinId: widget.arguments.recieveCoin.symbol,
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
                    '${widget.arguments.convert.toString()} ${widget.arguments.convertCoin.symbol.toUpperCase()}',
                recieve:
                    '${widget.arguments.recieve.toStringAsFixed(5)} ${widget.arguments.recieveCoin.symbol.toUpperCase()}',
                cambio: getExchange(),
              ),
            ),
            ReviewButtons(
              convertId: widget.arguments.data
                  .indexWhere((crypto) => crypto.id == widget.arguments.convertCoin.id),
              recieveId: widget.arguments.data
                  .indexWhere((crypto) => crypto.id == widget.arguments.recieveCoin.id),
              convert: widget.arguments.convert,
              recieve: widget.arguments.recieve,
              move: moves,
            ),
          ],
        ),
      ),
    );
  }
}

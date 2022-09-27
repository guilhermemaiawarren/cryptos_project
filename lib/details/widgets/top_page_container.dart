import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/get_price_provider.dart';
import 'package:projeto_criptos/shared/utils/decimal_to_double.dart';
import '../../shared/common_model/crypto.dart';

import '../../shared/utils/currency_formater.dart';

class TopPageContainer extends HookConsumerWidget {
  const TopPageContainer({
    Key? key,
    required this.model,
  }) : super(key: key);
  final CryptoEntity model;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var price = ref.watch(getPriceProvider.state).state;
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  model.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Montserrat',
                    color: Color.fromRGBO(47, 47, 51, 1),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: Image.network(model.image).image,
              ),
            ],
          ),
          Text(model.symbol.toUpperCase()),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              price == ''
                  ? currencyFormatter.format(dtd(model.currentPrice))
                  : price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromRGBO(47, 47, 51, 1),
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../portfolio/model/crypto_view_data.dart';

import '../../shared/utils/currency_formater.dart';
import '../../shared/utils/decimal_to_double.dart';

class TopPageContainer extends HookConsumerWidget {
  const TopPageContainer({
    Key? key,
    required this.model,
  }) : super(key: key);
  final CryptoViewData model;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              currencyFormatter.format(dtd(model.currentPrice)),
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

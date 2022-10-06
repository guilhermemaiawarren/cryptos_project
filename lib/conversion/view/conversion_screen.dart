import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/conversion/widgets/body_conversion_screen.dart';
import 'package:projeto_criptos/shared/common_model/crypto.dart';
import '../../portfolio/provider/cryptos_provider.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';

class ConversionScreen extends StatefulHookConsumerWidget {
  const ConversionScreen({
    Key? key,
    required this.coinAmmount,
    required this.asset,
  }) : super(key: key);
  final Decimal coinAmmount;
  final CryptoEntity asset;

  @override
  ConsumerState<ConversionScreen> createState() => _$ConversionScreenState();
}

class _$ConversionScreenState extends ConsumerState<ConversionScreen> {
  @override
  Widget build(BuildContext context) {
    final cryptos = ref.watch(cryptosProvider);

    return cryptos.when(
      data: (data) {
        return BodyConversionScreen(
          coinAmmount: widget.coinAmmount,
          asset: widget.asset,
          data: data,
        );
      },
      error: (e, s) {
        return ErrorBody(
          onRetry: () {
            ref.refresh(cryptosProvider);
          },
        );
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }
}

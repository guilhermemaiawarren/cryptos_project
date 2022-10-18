import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projeto_criptos/l10n/core_strings.dart';
import 'package:projeto_criptos/shared/theme/theme_data_criptos.dart';

class L10nWidgetTester extends StatelessWidget {
  final Locale locale;
  const L10nWidgetTester({
    Key? key,
    required this.locale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        localizationsDelegates: CoreStrings.localizationsDelegates,
        locale: locale,
        supportedLocales: CoreStrings.supportedLocales,
        home: const Material(
          child: L10nWidget(),
        ),
        theme: themeDataCriptos(),
      ),
    );
  }
}

class L10nWidget extends StatelessWidget {
  const L10nWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(CoreStrings.of(context)!.availableBalance),
        Text(CoreStrings.of(context)!.cancel),
        Text(CoreStrings.of(context)!.conclude),
        Text(CoreStrings.of(context)!.concludedConvertsion),
        Text(CoreStrings.of(context)!.concludedConvertsionText),
        Text(CoreStrings.of(context)!.convert),
        Text(CoreStrings.of(context)!.convertCoin),
        Text(CoreStrings.of(context)!.crypto),
        Text(CoreStrings.of(context)!.details),
        Text(CoreStrings.of(context)!.errorMessage),
        Text(CoreStrings.of(context)!.estimatedTotal),
        Text(CoreStrings.of(context)!.exchange),
        Text(CoreStrings.of(context)!.moves),
        Text(CoreStrings.of(context)!.portfolio),
        Text(CoreStrings.of(context)!.price),
        Text(CoreStrings.of(context)!.quantity),
        Text(CoreStrings.of(context)!.recieve),
        Text(CoreStrings.of(context)!.retry),
        Text(CoreStrings.of(context)!.review),
        Text(CoreStrings.of(context)!.reviewText),
        Text(CoreStrings.of(context)!.textConvert),
        Text(CoreStrings.of(context)!.totalBalanceHelper),
        Text(CoreStrings.of(context)!.validatorReturnOne),
        Text(CoreStrings.of(context)!.validatorReturnThree),
        Text(CoreStrings.of(context)!.validatorReturnTwo),
        Text(CoreStrings.of(context)!.variation),
        Text(CoreStrings.of(context)!.value),
      ],
    );
  }
}

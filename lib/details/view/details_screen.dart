import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../controller/days_provider.dart';
import '../widgets/body_details_screen.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends HookConsumerWidget {
  const DetailsScreen({Key? key, required this.asset}) : super(key: key);
  static const route = '/details';

  final CryptoViewData asset;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as CryptoViewData;
    Future.delayed(Duration.zero, () {
      ref.read(daysProvider.state).state = 5;
    });
    return Scaffold(
      appBar: const DetailsAppBar(),
      body: BodyDetailsScreen(
        coin: args,
      ),
    );
  }
}

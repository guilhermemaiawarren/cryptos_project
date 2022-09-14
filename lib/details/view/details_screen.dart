import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_criptos/details/controller/details_asset_provider.dart';
import 'package:projeto_criptos/details/widgets/change_x_axis_buttons.dart';
import 'package:projeto_criptos/details/widgets/details_app_bar.dart';
import 'package:projeto_criptos/details/widgets/graph_details.dart';
import 'package:projeto_criptos/details/widgets/top_page_asset_container.dart';

import '../../shared/models/asset_model.dart';
import '../../shared/templates/warren_button.dart';
import '../widgets/info_column.dart';

class DetailsScreen extends StatefulHookConsumerWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static String route = '/details';

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    AssetModel model = ref.watch(detailsAssetProvider.notifier).state;
    return Scaffold(
      appBar: const DetailsAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TopPageAssetContainer(),
          const GraphDetails(),
          const ChangeXAxisButtons(),
          InfoColumn(),
          WarrenButton(onPressed: () {}),
        ],
      ),
    );
  }
}

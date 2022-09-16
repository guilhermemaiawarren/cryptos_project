
import 'package:flutter/material.dart';

import '../../shared/templates/warren_button.dart';
import 'asset_graph.dart';
import 'change_x_axis_list.dart';
import 'info_asset_column.dart';
import 'top_page_asset_container.dart';

class BodyDetailsScreen extends StatelessWidget {
  const BodyDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const TopPageAssetContainer(),
        const GraphDetails(),
        const ChangeXAxisButtons(),
        const InfoColumn(),
        WarrenButton(onPressed: () {}),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'top_page_asset_container.dart';

import '../../shared/templates/warren_button.dart';
import 'change_x_axis_buttons.dart';
import 'graph_details.dart';
import 'info_column.dart';

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
        InfoColumn(),
        WarrenButton(onPressed: () {}),
      ],
    );
  }
}

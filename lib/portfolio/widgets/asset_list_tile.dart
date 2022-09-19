import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/controller/arguments.dart';
import 'package:projeto_criptos/portfolio/widgets/visibility_off_container.dart';
import 'package:projeto_criptos/shared/models/api_asset_model.dart';

import '../../shared/utils/currency_formater.dart';
import '../controller/visible_provider.dart';

class AssetListTile extends HookConsumerWidget {
  const AssetListTile({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final ApiAssetModel asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibleProvider.state);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: Arguments(
            asset: asset,
          ),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          asset.image,
          scale: 6,
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(asset.symbol.toUpperCase())),
          visible.state
              ? Text(
                  currencyFormatter.format(
                    asset.currentPrice,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                )
              : const VisibilityOffContainer(
                  witdh: 110,
                  height: 15,
                ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            asset.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
          visible.state
              ? Text(
                  "0.5 ${asset.symbol.toUpperCase()}")
              : const VisibilityOffContainer(
                  witdh: 60,
                  height: 15,
                ),
          const Padding(
            padding: EdgeInsets.only(left: 35),
          ),
        ],
      ),
    );
  }
}

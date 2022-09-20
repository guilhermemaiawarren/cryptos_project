import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/portfolio/controller/arguments.dart';
import 'package:projeto_criptos/portfolio/widgets/visibility_off_container.dart';
import 'package:projeto_criptos/shared/models/asset_model.dart';

import '../../shared/utils/currency_formater.dart';
import '../controller/visible_provider.dart';

class AssetListTile extends StatefulHookConsumerWidget {
  const AssetListTile({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final AssetModel asset;

  @override
  ConsumerState<AssetListTile> createState() => _AssetListTileState();
}

class _AssetListTileState extends ConsumerState<AssetListTile> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibleProvider.state);
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: Arguments(
            asset: widget.asset,
          ),
        ).whenComplete(
          () => setState(() {}),
        );
      },
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.transparent,
        backgroundImage: Image.network(
          widget.asset.image,
        ).image,
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(widget.asset.symbol.toUpperCase())),
          visible.state
              ? Text(
                  currencyFormatter.format(
                    widget.asset.currentPrice,
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
            widget.asset.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
          visible.state
              ? Text("0.5 ${widget.asset.symbol.toUpperCase()}")
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

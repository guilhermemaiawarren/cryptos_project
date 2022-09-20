import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/get_historic_data_provider.dart';
import 'package:projeto_criptos/details/controller/list_provider.dart';
import 'package:projeto_criptos/details/controller/range_price_provider.dart';
import '../controller/details_asset_notifier_provider.dart';
import '../../shared/models/asset_model.dart';
import '../controller/graph_axis_provider.dart';

class ChangeAxisButton extends StatefulHookConsumerWidget {
  const ChangeAxisButton({
    Key? key,
    required this.buttonDays,
  }) : super(key: key);

  final int buttonDays;
  @override
  ConsumerState<ChangeAxisButton> createState() => _ChangeAxisButtonState();
}

class _ChangeAxisButtonState extends ConsumerState<ChangeAxisButton> {
  late AssetModel model;
  late int graphAxis;

  @override
  Widget build(BuildContext context) {
    model = ref.watch(detailsAssetProvider.notifier).state;
    graphAxis = ref.watch(graphAxisProvider.state).state;
    return InkWell(
      onTap: () {
        setState(() {
          ref.read(graphAxisProvider.state).state = widget.buttonDays;
          ref
              .read(detailsAssetProvider.notifier)
              .changeVariation(widget.buttonDays);
          ref
              .read(getHistoricDataProvider.notifier)
              .getHistoricData(model.id, widget.buttonDays);
          ref.read(listProvider.state).state =
              ref.read(getHistoricDataProvider.notifier).state;
          ref
              .read(rangePriceProvider.notifier)
              .changePriceByRange(widget.buttonDays, model);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: graphAxis == widget.buttonDays
              ? const Color.fromRGBO(238, 240, 247, 1)
              : Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Text(
          widget.buttonDays == 1 ? '24H' : '${widget.buttonDays}D',
          style: TextStyle(
            color: graphAxis == widget.buttonDays
                ? Colors.black
                : Colors.grey.shade500,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

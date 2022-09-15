import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/details/controller/details_asset_provider.dart';
import 'package:projeto_criptos/details/controller/variation_provider.dart';
import '../../shared/models/asset_model.dart';
import '../controller/range_variation_provider.dart';
import '../controller/x_axis_provider.dart';

class ChangeAxisButton extends StatefulHookConsumerWidget {
  const ChangeAxisButton({Key? key, required this.buttonDays})
      : super(key: key);

  final int buttonDays;
  @override
  ConsumerState<ChangeAxisButton> createState() => _ChangeAxisButtonState();
}

class _ChangeAxisButtonState extends ConsumerState<ChangeAxisButton> {
  late AssetModel model;

  @override
  Widget build(BuildContext context) {
    model = ref.watch(detailsAssetProvider.notifier).state;
    return InkWell(
      onTap: () {
        setState(() {
          ref.read(xAxisProvider.state).state = widget.buttonDays;
          ref.read(rangeVariationProvider.state).state = widget.buttonDays;
          ref.read(variationProvider.notifier).changeVariation(widget.buttonDays, model);
          model.variation = ref.read(variationProvider.notifier).state;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ref.watch(xAxisProvider.state).state == widget.buttonDays
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
          '${widget.buttonDays}D',
          style: TextStyle(
            color: Colors.grey.shade800,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../l10n/core_strings.dart';
import '../shared/common_model/move_model.dart';
import '../shared/templates/app_assets.dart';

class SucessConversionPage extends StatefulWidget {
  const SucessConversionPage({
    Key? key,
    required this.move,
  }) : super(key: key);
  static const route = '/success';
  final MoveModel move;
  @override
  State<SucessConversionPage> createState() => _SucessConversionPageState();
}

class _SucessConversionPageState extends State<SucessConversionPage> {
  double radius = 30;
  void animateContainer() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        radius = 75;
      });
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        radius = 30;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    animateContainer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/moves',
              arguments: widget.move,
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                key: const Key('AnimatedContainer'),
                duration: const Duration(seconds: 2),
                curve: Curves.easeIn,
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const ImageIcon(
                    AssetImage('assets/icons/success_button.png'),
                  ).image,
                ),
              ),
              AutoSizeText(
                CoreStrings.of(context)!.concludedConvertsion,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 32.5,
                  fontFamily: AppAssets.montSerrat,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                CoreStrings.of(context)!.concludedConvertsionText,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

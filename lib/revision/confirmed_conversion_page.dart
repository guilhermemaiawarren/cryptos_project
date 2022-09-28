import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';

class ConfirmedConversionPage extends StatefulWidget {
  const ConfirmedConversionPage({Key? key}) : super(key: key);

  @override
  State<ConfirmedConversionPage> createState() =>
      _ConfirmedConversionPageState();
}

class _ConfirmedConversionPageState extends State<ConfirmedConversionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            Navigator.pushReplacementNamed(context, '/portfolio');
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
              AnimatedBuilder(
                animation: _controller.view,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: child,
                  );
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: const ImageIcon(
                    AssetImage('assets/icons/success_button.png'),
                  ).image,
                ),
              ),
              AutoSizeText(
                'Conversão efetuada',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 32.5,
                  fontFamily: AppAssets.montSerrat,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Conversão de moeda efetuada com sucesso!',
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

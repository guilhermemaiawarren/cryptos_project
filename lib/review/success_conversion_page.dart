import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';

class SucessConversionPage extends StatefulWidget {
  const SucessConversionPage({Key? key}) : super(key: key);
  static const route = '/success';
  @override
  State<SucessConversionPage> createState() => _SucessConversionPageState();
}

class _SucessConversionPageState extends State<SucessConversionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
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
            Navigator.pushReplacementNamed(context, '/moves');
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
                child: AnimatedContainer(
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

import 'package:flutter/material.dart';

import 'package:projeto_criptos/details/widgets/info_row_details.dart';
import 'package:projeto_criptos/shared/templates/app_assets.dart';
import 'package:projeto_criptos/shared/templates/model_app_bar.dart';
import 'package:projeto_criptos/shared/templates/warren_button.dart';

import 'confirmed_conversion_page.dart';

class RevisionPage extends StatelessWidget {
  const RevisionPage({
    Key? key,
    required this.convert,
    required this.recieve,
    required this.cambio,
  }) : super(key: key);
  static const route = '/revision';
  final String convert;
  final String recieve;
  final String cambio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ModelAppBar(text: 'Revisar'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Revise os dados da sua conversão',
              style: TextStyle(
                fontSize: 30,
                fontFamily: AppAssets.montSerrat,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(thickness: 1),
                  InfoRowDetails(label: 'Converter', text: convert),
                  const Divider(thickness: 1),
                  InfoRowDetails(label: 'Receber', text: recieve),
                  const Divider(thickness: 1),
                  InfoRowDetails(label: 'Câmbio', text: cambio),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Expanded(
                    child: WarrenButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: 'Cancelar',
                      borderSide: BorderSide(
                        color: AppAssets.magenta,
                      ),
                      textColor: AppAssets.magenta,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Expanded(
                    child: WarrenButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 250),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              animation = ProxyAnimation(animation);
                              return ScaleTransition(
                                scale: animation,
                                alignment: Alignment.center,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animation2) {
                              return const ConfirmedConversionPage();
                            },
                          ),
                        );
                      },
                      text: 'Concluir',
                      color: AppAssets.magenta,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../setup/setup_l10n_tester.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load L10nWidgetTester THEN test portuguese texts', (WidgetTester tester) async {
    await loadPage(tester, const L10nWidgetTester(locale: Locale('pt', 'BR')));

    expect(find.text('Portfólio'), findsOneWidget);
    expect(find.text('Movimentações'), findsOneWidget);
    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Valor total de moedas'), findsOneWidget);
    expect(find.text('Detalhes'), findsOneWidget);
    expect(find.text('Preço'), findsOneWidget);
    expect(find.text('Variação'), findsOneWidget);
    expect(find.text('Quantidade'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Converter Moeda'), findsOneWidget);
    expect(find.text('Converter'), findsOneWidget);
    expect(find.text('Saldo Disponível'), findsOneWidget);
    expect(find.text("Quanto você gostaria de converter?"), findsOneWidget);
    expect(find.text('Valor não pode ser zero'), findsOneWidget);
    expect(find.text('O primeiro caractere não pode ser especial'), findsOneWidget);
    expect(find.text('Saldo Insuficiente'), findsOneWidget);
    expect(find.text('Total Estimado'), findsOneWidget);
    expect(find.text('Revisar'), findsOneWidget);
    expect(find.text('Revise os dados da sua conversão'), findsOneWidget);
    expect(find.text('Receber'), findsOneWidget);
    expect(find.text('Câmbio'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);
    expect(find.text('Concluir'), findsOneWidget);
    expect(find.text('Conversão efetuada'), findsOneWidget);
    expect(find.text('Conversão de moeda efetuada com sucesso!'), findsOneWidget);
    expect(find.text('Ops! Ocorreu um erro'), findsOneWidget);
    expect(find.text('Tentar Novamente'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../setup/setup_l10n_tester.dart';
import '../../setup/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN load L10nWidgetTester THEN test spanish texts',
      (WidgetTester tester) async {
    await loadPage(tester, const L10nWidgetTester(locale: Locale('es', '')));

    expect(find.text('Portafolio'), findsOneWidget);
    expect(find.text('Movimientos'), findsOneWidget);
    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Valor total de la moneda'), findsOneWidget);
    expect(find.text('Detalles'), findsOneWidget);
    expect(find.text('Precio'), findsOneWidget);
    expect(find.text('Variación'), findsOneWidget);
    expect(find.text('Cantidad'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Convertir Moneda'), findsOneWidget);
    expect(find.text('Convertir'), findsOneWidget);
    expect(find.text('Saldo Disponible'), findsOneWidget);
    expect(find.text("¿Cuánto te gustaría convertir?"), findsOneWidget);
    expect(find.text('El valor no puede ser cero'), findsOneWidget);
    expect(
        find.text('El primer carácter no puede ser especial.'), findsOneWidget);
    expect(find.text('Fondos insuficientes'), findsOneWidget);
    expect(find.text('Total Estimado'), findsOneWidget);
    expect(find.text('Revisar'), findsOneWidget);
    expect(find.text('Revisa tus datos de conversión'), findsOneWidget);
    expect(find.text('Recibir'), findsOneWidget);
    expect(find.text('Intercambio'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);
    expect(find.text('Concluir'), findsOneWidget);
    expect(find.text('Conversión realizada'), findsOneWidget);
    expect(find.text('¡Conversión de moneda exitosa!'), findsOneWidget);
    expect(find.text('¡Ups! Ocurrio un error'), findsOneWidget);
    expect(find.text('Intentar nuevamente'), findsOneWidget);
  });
}

import 'core_strings.dart';

/// The translations for Spanish Castilian (`es`).
class CoreStringsEs extends CoreStrings {
  CoreStringsEs([String locale = 'es']) : super(locale);

  @override
  String get portfolio => 'Portafolio';

  @override
  String get moves => 'Movimientos';

  @override
  String get crypto => 'Cripto';

  @override
  String get totalBalanceHelper => 'Valor total de la moneda';

  @override
  String get details => 'Detalles';

  @override
  String get price => 'Precio';

  @override
  String get variation => 'Variación';

  @override
  String get quantity => 'Cantidad';

  @override
  String get value => 'Valor';

  @override
  String get convertCoin => 'Convertir Moneda';

  @override
  String get convert => 'Convertir';

  @override
  String get availableBalance => 'Saldo Disponible';

  @override
  String get textConvert => '¿Cuánto te gustaría convertir?';

  @override
  String get validatorReturnOne => 'El valor no puede ser cero';

  @override
  String get validatorReturnTwo => 'El primer carácter no puede ser especial.';

  @override
  String get validatorReturnThree => 'Fondos insuficientes';

  @override
  String get estimatedTotal => 'Total Estimado';

  @override
  String get review => 'Revisar';

  @override
  String get reviewText => 'Revisa tus datos de conversión';

  @override
  String get recieve => 'Recibir';

  @override
  String get exchange => 'Intercambio';

  @override
  String get cancel => 'Cancelar';

  @override
  String get conclude => 'Concluir';

  @override
  String get concludedConvertsion => 'Conversión realizada';

  @override
  String get concludedConvertsionText => '¡Conversión de moneda exitosa!';

  @override
  String get errorMessage => '¡Ups! Ocurrio un error';

  @override
  String get retry => 'Intentar nuevamente';
}

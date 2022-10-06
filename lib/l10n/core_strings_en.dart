import 'core_strings.dart';

/// The translations for English (`en`).
class CoreStringsEn extends CoreStrings {
  CoreStringsEn([String locale = 'en']) : super(locale);

  @override
  String get portfolio => 'Portfolio';

  @override
  String get moves => 'Moves';

  @override
  String get crypto => 'Crypto';

  @override
  String get totalBalanceHelper => 'Total crypto wealth';

  @override
  String get details => 'Details';

  @override
  String get price => 'Price';

  @override
  String get variation => 'Variation';

  @override
  String get quantity => 'Ammount';

  @override
  String get value => 'Value';

  @override
  String get convertCoin => 'Convert Crypto';

  @override
  String get convert => 'Convert';

  @override
  String get availableBalance => 'Available Balance';

  @override
  String get textConvert => 'How much would you like to convert?';

  @override
  String get validatorReturnOne => 'Value must be more than zero';

  @override
  String get validatorReturnTwo => 'The first character can\'t be special';

  @override
  String get validatorReturnThree => 'Insufficient Funds';

  @override
  String get estimatedTotal => 'Estimated Total';

  @override
  String get review => 'Review';

  @override
  String get reviewText => 'Review your conversion data';

  @override
  String get recieve => 'Recieve';

  @override
  String get exchange => 'Exchange';

  @override
  String get cancel => 'Cancel';

  @override
  String get conclude => 'Conclude';

  @override
  String get concludedConvertsion => 'Conversion performed';

  @override
  String get concludedConvertsionText => 'Currency conversion successful!';

  @override
  String get errorMessage => 'Ops! An error has occurred';

  @override
  String get retry => 'Try Again';
}

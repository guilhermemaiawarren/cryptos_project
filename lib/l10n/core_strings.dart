import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_strings_en.dart';
import 'core_strings_es.dart';
import 'core_strings_pt.dart';

/// Callers can lookup localized strings with an instance of CoreStrings
/// returned by `CoreStrings.of(context)`.
///
/// Applications need to include `CoreStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/core_strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreStrings.localizationsDelegates,
///   supportedLocales: CoreStrings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CoreStrings.supportedLocales
/// property.
abstract class CoreStrings {
  CoreStrings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreStrings? of(BuildContext context) {
    return Localizations.of<CoreStrings>(context, CoreStrings);
  }

  static const LocalizationsDelegate<CoreStrings> delegate = _CoreStringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// No description provided for @portfolio.
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// No description provided for @moves.
  ///
  /// In en, this message translates to:
  /// **'Moves'**
  String get moves;

  /// No description provided for @crypto.
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// No description provided for @totalBalanceHelper.
  ///
  /// In en, this message translates to:
  /// **'Total crypto wealth'**
  String get totalBalanceHelper;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @variation.
  ///
  /// In en, this message translates to:
  /// **'Variation'**
  String get variation;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Ammount'**
  String get quantity;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @convertCoin.
  ///
  /// In en, this message translates to:
  /// **'Convert Crypto'**
  String get convertCoin;

  /// No description provided for @convert.
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convert;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// No description provided for @textConvert.
  ///
  /// In en, this message translates to:
  /// **'How much would you like to convert?'**
  String get textConvert;

  /// No description provided for @validatorReturnOne.
  ///
  /// In en, this message translates to:
  /// **'Value must be more than zero'**
  String get validatorReturnOne;

  /// No description provided for @validatorReturnTwo.
  ///
  /// In en, this message translates to:
  /// **'The first character can\'t be special'**
  String get validatorReturnTwo;

  /// No description provided for @validatorReturnThree.
  ///
  /// In en, this message translates to:
  /// **'Insufficient Funds'**
  String get validatorReturnThree;

  /// No description provided for @estimatedTotal.
  ///
  /// In en, this message translates to:
  /// **'Estimated Total'**
  String get estimatedTotal;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @reviewText.
  ///
  /// In en, this message translates to:
  /// **'Review your conversion data'**
  String get reviewText;

  /// No description provided for @recieve.
  ///
  /// In en, this message translates to:
  /// **'Recieve'**
  String get recieve;

  /// No description provided for @exchange.
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @conclude.
  ///
  /// In en, this message translates to:
  /// **'Conclude'**
  String get conclude;

  /// No description provided for @concludedConvertsion.
  ///
  /// In en, this message translates to:
  /// **'Conversion performed'**
  String get concludedConvertsion;

  /// No description provided for @concludedConvertsionText.
  ///
  /// In en, this message translates to:
  /// **'Currency conversion successful!'**
  String get concludedConvertsionText;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Ops! An error has occurred'**
  String get errorMessage;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get retry;
}

class _CoreStringsDelegate extends LocalizationsDelegate<CoreStrings> {
  const _CoreStringsDelegate();

  @override
  Future<CoreStrings> load(Locale locale) {
    return SynchronousFuture<CoreStrings>(lookupCoreStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreStringsDelegate old) => false;
}

CoreStrings lookupCoreStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CoreStringsEn();
    case 'es': return CoreStringsEs();
    case 'pt': return CoreStringsPt();
  }

  throw FlutterError(
    'CoreStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

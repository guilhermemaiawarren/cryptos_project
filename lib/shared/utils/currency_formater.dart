import 'dart:io';

import 'package:intl/intl.dart';

NumberFormat currencyFormatter = NumberFormat.simpleCurrency(
  locale: Platform.localeName,
);

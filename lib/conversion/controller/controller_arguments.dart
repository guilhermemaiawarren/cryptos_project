import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/shared/utils/arguments/to_revision_arguments.dart';

final controllerArgumentsProvider = StateProvider(
  (ref) {
    return ToRevisionArguments(
      convert: '',
      recieve: '',
      cambio: '',
    );
  },
);

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_criptos/src/domain/entities/user_model.dart';

var userProvider = StateProvider((ref) => UserModel());


import 'package:medboss/features/auth/data/remote/data_sources/auth_remote.dart';
import 'package:medboss/features/auth/data/repositories/auth_repository.dart';
import 'package:medboss/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:medboss/features/auth/presentation/pages/login_page/bloc/login_bloc.dart';
import 'package:medboss/features/auth/presentation/pages/sign_up/bloc/sign_up_bloc.dart';

import '../../../features/auth/application/auth_facade.dart';
import '../../../features/auth/data/local/data_sources/auth_locale.dart';
import '../service_locator.dart';

Future<void> authDependencies() async {
  sl.registerLazySingleton(
    () => AuthRemote(),
  );
  sl.registerLazySingleton(
    () => AuthLocale(sl()),
  );

  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(sl(), sl(), sl()),
  );
  sl.registerLazySingleton(
    () => AuthFacade(sl()),
  );
  sl.registerLazySingleton(
    () => LoginBloc(sl()),
  );
  sl.registerLazySingleton(
    () => SignUpBloc(sl()),
  );
}

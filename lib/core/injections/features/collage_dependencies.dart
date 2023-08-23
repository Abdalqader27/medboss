import 'package:medboss/features/collage/application/collage_facade.dart';
import 'package:medboss/features/collage/data/local/data_sources/collage_locale.dart';
import 'package:medboss/features/collage/data/remote/data_sources/collage_remote.dart';
import 'package:medboss/features/collage/domain/repositories/i_collage_repository.dart';

import '../../../features/collage/data/repositories/collage_repository.dart';
import '../../../features/collage/presentation/pages/select_collage/select_collage_stream.dart';
import '../service_locator.dart';

Future<void> collageDependencies() async {
  sl.registerLazySingleton(
    () => CollageRemote(),
  );
  sl.registerLazySingleton(
    () => CollageLocale(sl()),
  );

  sl.registerLazySingleton(
    () => SelectCollageStream(),
  );
  sl.registerLazySingleton<ICollageRepository>(
    () => CollageRepository(
      sl(),
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CollageFacade(sl()),
  );
}

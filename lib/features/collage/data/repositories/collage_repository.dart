import 'package:core/core.dart';
import 'package:medboss/features/collage/data/local/data_sources/collage_locale.dart';

import '../../../../common/utils/i_transformer.dart';
import '../../domain/repositories/i_collage_repository.dart';
import '../remote/data_sources/collage_remote.dart';
import '../transformer/collage_transformer.dart';

class CollageRepository extends ICollageRepository {
  CollageRepository(this.collageRemote, this.collageLocale);

  final CollageRemote collageRemote;
  final CollageLocale collageLocale;

  @override
  Future<ITransformer> getAllCollages(Params params) {
    return throwAppException(
      () async {
        final fetchPolicy = params.fetchPolicy;
        final fetchNetwork = fetchPolicy.isNetworkPolicy;

        final localeCollages = await collageLocale.getAllCollages();

        if (localeCollages.isEmpty || fetchNetwork) {
          final response = await collageRemote.getAllCollage(params);
          final remoteCollages = await parseRemoteCollage(response);

          await collageLocale.cacheAllCategories(remoteCollages);

          return CollageModelTransformer(remoteCollages);
        }
        return CollageDataTransformer(localeCollages);
      },
    );
  }
}

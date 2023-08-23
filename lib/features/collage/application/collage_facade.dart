import 'package:core/core.dart';
import 'package:medboss/features/collage/domain/entities/collage.dart';
import 'package:medboss/features/collage/domain/repositories/i_collage_repository.dart';
import 'package:rxdart/rxdart.dart';

class CollageFacade {
  CollageFacade(this._collageRepository);

  final ICollageRepository _collageRepository;


  Future<ApiResult<List<Collage>>> getAllCollages(Params params) {
    return toApiResult(() async {
      final collages = await _collageRepository.getAllCollages(params);
      return collages.transform();
    });
  }


}

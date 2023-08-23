import 'package:core/core.dart';
import 'package:medboss/features/collage/domain/entities/collage.dart';

import '../../../../common/utils/i_transformer.dart';
import '../../data/remote/models/collage_model.dart';

abstract class ICollageRepository {
  Future<ITransformer> getAllCollages(Params params);


}

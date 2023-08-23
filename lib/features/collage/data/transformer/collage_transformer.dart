import 'package:core/core.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/features/collage/data/remote/models/collage_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../common/utils/i_transformer.dart';
import '../../domain/entities/collage.dart';

Future<List<CollageModel>> parseRemoteCollage(ParseResponse response) async {
  if (response.success && response.result != null) {
    final results = response.results;
    final collages = results!.map(
      (e) {
        return CollageModel.fromJson(e.toJson());
      },
    ).toList();
    return collages;
  }
  throw AppException(
    message: response.error?.message ?? '',
    exception: Exception(response.error?.code.toString()),
  );
}

class CollageModelTransformer
    extends ITransformer<List<CollageModel>, List<Collage>> {
  CollageModelTransformer(super.model);

  @override
  List<Collage> transform() {
    return model.map((e) => e.toCollage()).toList();
  }
}

class CollageDataTransformer
    extends ITransformer<List<CollageData>, List<Collage>> {
  CollageDataTransformer(super.model);

  @override
  List<Collage> transform() {
    return model.map((e) => e.toCollage()).toList();
  }
}

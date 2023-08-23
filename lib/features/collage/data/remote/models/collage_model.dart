import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medboss/core/database/database.dart';

import '../../../domain/entities/collage.dart';

part 'collage_model.freezed.dart';

part 'collage_model.g.dart';

@freezed
class CollageModel with _$CollageModel {
  const CollageModel._();

  const factory CollageModel(
      {required String className,
      required String objectId,
      required DateTime createdAt,
      required DateTime updatedAt,
      required String name,
      @JsonKey(name: 'collage_id') required String collageId}) = _CollageModel;

  factory CollageModel.fromJson(Map<String, dynamic> json) =>
      _$CollageModelFromJson(json);

  Collage toCollage() {
    return Collage(
      objectId: objectId,
      name: name,
      collageId: collageId,
    );
  }

  CollageData toData() {
    return CollageData(
      objectId: objectId,
      name: name,
      collageId: collageId,
    );
  }
}

extension ExCollageData on CollageData {
  Collage toCollage() {
    return Collage(
      objectId: objectId,
      name: name,
      collageId: collageId,
    );
  }
}

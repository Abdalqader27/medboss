import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collage.freezed.dart';
part 'collage.g.dart';

@freezed
class Collage with _$Collage {
  const Collage._();
  const factory Collage({
    required String objectId,
    required String name,
    @JsonKey(name: 'collage_id') required String collageId
  }) = _Collage;



  factory Collage.fromJson(Map<String, dynamic> json) =>
      _$CollageFromJson(json);
}
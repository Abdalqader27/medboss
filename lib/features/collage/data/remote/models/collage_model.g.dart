// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CollageModel _$$_CollageModelFromJson(Map<String, dynamic> json) =>
    _$_CollageModel(
      className: json['className'] as String,
      objectId: json['objectId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      name: json['name'] as String,
      collageId: json['collage_id'] as String,
    );

Map<String, dynamic> _$$_CollageModelToJson(_$_CollageModel instance) =>
    <String, dynamic>{
      'className': instance.className,
      'objectId': instance.objectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'collage_id': instance.collageId,
    };

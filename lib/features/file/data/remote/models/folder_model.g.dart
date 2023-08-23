// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FolderModel _$$_FolderModelFromJson(Map<String, dynamic> json) =>
    _$_FolderModel(
      className: json['className'] as String,
      objectId: json['objectId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      universityId: json['UniversityId'] as String,
      parentId: json['ParentId'] as String,
      hasFiles: json['HasFiles'] as bool,
      name: json['Name'] as String,
      id: json['ID'] as String,
    );

Map<String, dynamic> _$$_FolderModelToJson(_$_FolderModel instance) =>
    <String, dynamic>{
      'className': instance.className,
      'objectId': instance.objectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'UniversityId': instance.universityId,
      'ParentId': instance.parentId,
      'HasFiles': instance.hasFiles,
      'Name': instance.name,
      'ID': instance.id,
    };

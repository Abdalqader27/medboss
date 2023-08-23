// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileModel _$$_FileModelFromJson(Map<String, dynamic> json) => _$_FileModel(
      className: json['className'] as String,
      objectId: json['objectId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      urlFile: UrlFileModel.fromJson(json['MyFile'] as Map<String, dynamic>),
      folderId: json['FolderId'] as String,
      universityId: json['UniversityId'] as String,
      fileName: json['FileName'] as String,
      isActivated: json['IsActivated'] as bool,
    );

Map<String, dynamic> _$$_FileModelToJson(_$_FileModel instance) =>
    <String, dynamic>{
      'className': instance.className,
      'objectId': instance.objectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'MyFile': instance.urlFile,
      'FolderId': instance.folderId,
      'UniversityId': instance.universityId,
      'FileName': instance.fileName,
      'IsActivated': instance.isActivated,
    };

_$_UrlFileModel _$$_UrlFileModelFromJson(Map<String, dynamic> json) =>
    _$_UrlFileModel(
      type: json['__type'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_UrlFileModelToJson(_$_UrlFileModel instance) =>
    <String, dynamic>{
      '__type': instance.type,
      'name': instance.name,
      'url': instance.url,
    };

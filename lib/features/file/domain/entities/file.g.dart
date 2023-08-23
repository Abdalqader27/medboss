// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_File _$$_FileFromJson(Map<String, dynamic> json) => _$_File(
      objectId: json['objectId'] as String,
      urlFile: UrlFile.fromJson(json['MyFile'] as Map<String, dynamic>),
      folderId: json['FolderId'] as String,
      universityId: json['UniversityId'] as String,
      fileName: json['FileName'] as String,
      isActivated: json['IsActivated'] as bool,
    );

Map<String, dynamic> _$$_FileToJson(_$_File instance) => <String, dynamic>{
      'objectId': instance.objectId,
      'MyFile': instance.urlFile,
      'FolderId': instance.folderId,
      'UniversityId': instance.universityId,
      'FileName': instance.fileName,
      'IsActivated': instance.isActivated,
    };

_$_UrlFile _$$_UrlFileFromJson(Map<String, dynamic> json) => _$_UrlFile(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_UrlFileToJson(_$_UrlFile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

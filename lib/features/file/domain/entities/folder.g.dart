// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Folder _$$_FolderFromJson(Map<String, dynamic> json) => _$_Folder(
      objectId: json['objectId'] as String,
      universityId: json['UniversityId'] as String,
      parentId: json['ParentId'] as String,
      hasFiles: json['HasFiles'] as bool,
      name: json['Name'] as String,
      id: json['ID'] as String,
    );

Map<String, dynamic> _$$_FolderToJson(_$_Folder instance) => <String, dynamic>{
      'objectId': instance.objectId,
      'UniversityId': instance.universityId,
      'ParentId': instance.parentId,
      'HasFiles': instance.hasFiles,
      'Name': instance.name,
      'ID': instance.id,
    };

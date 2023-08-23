import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../core/database/database.dart';

part 'file.freezed.dart';

part 'file.g.dart';

@freezed
class File with _$File {
  const File._();

  const factory File({
    required String objectId,
    @JsonKey(name: 'MyFile') required UrlFile urlFile,
    @JsonKey(name: 'FolderId') required String folderId,
    @JsonKey(name: 'UniversityId') required String universityId,
    @JsonKey(name: 'FileName') required String fileName,
    @JsonKey(name: 'IsActivated') required bool isActivated,
  }) = _File;

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  toFileDate() {
    return FileData(
      objectId: objectId,
      folderId: int.parse(folderId),
      universityId: int.parse(universityId),
      isActivated: isActivated,
      name: fileName,
      myFile: urlFile.url,
    );
  }
}

@freezed
class UrlFile with _$UrlFile {
  const UrlFile._();

  const factory UrlFile({
    required String name,
    required String url,
  }) = _UrlFile;

  factory UrlFile.fromJson(Map<String, dynamic> json) =>
      _$UrlFileFromJson(json);
}

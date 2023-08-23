import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/database/database.dart';
import '../../../domain/entities/file.dart';

part 'file_model.freezed.dart';

part 'file_model.g.dart';

@freezed
class FileModel with _$FileModel {
  const FileModel._();

  const factory FileModel({
    required String className,
    required String objectId,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(name: 'MyFile') required UrlFileModel urlFile,
    @JsonKey(name: 'FolderId') required String folderId,
    @JsonKey(name: 'UniversityId') required String universityId,
    @JsonKey(name: 'FileName') required String fileName,
    @JsonKey(name: 'IsActivated') required bool isActivated,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  FileData toData() {
    return FileData(
      objectId: objectId,
      myFile: urlFile.url,
      folderId: int.parse(folderId),
      universityId: int.parse(universityId),
      name: fileName,
      isActivated: isActivated,
    );
  }

  File toFile() {
    return File(
      objectId: objectId,
      urlFile: urlFile.toUrlFile(),
      folderId: folderId,
      universityId: universityId,
      fileName: fileName,
      isActivated: isActivated,
    );
  }
}

@freezed
class UrlFileModel with _$UrlFileModel {
  const UrlFileModel._();

  const factory UrlFileModel({
    @JsonKey(name: '__type') required String type,
    required String name,
    required String url,
  }) = _UrlFileModel;

  factory UrlFileModel.fromJson(Map<String, dynamic> json) =>
      _$UrlFileModelFromJson(json);

  UrlFile toUrlFile() {
    return UrlFile(
      name: name,
      url: url,
    );
  }
}

extension ExFileData on FileData {
  File toFile() {
    return File(
      objectId: objectId,
      urlFile: UrlFile(
        name: '',
        url: myFile,
      ),
      folderId: folderId.toString(),
      universityId: universityId.toString(),
      fileName: name,
      isActivated: isActivated,
    );
  }
}

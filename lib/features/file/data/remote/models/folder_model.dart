import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/database/database.dart';
import '../../../domain/entities/folder.dart';

part 'folder_model.freezed.dart';

part 'folder_model.g.dart';

@freezed
class FolderModel with _$FolderModel {
  const FolderModel._();

  const factory FolderModel({
    required String className,
    required String objectId,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(name: 'UniversityId') required String universityId,
    @JsonKey(name: 'ParentId') required String parentId,
    @JsonKey(name: 'HasFiles') required bool hasFiles,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'ID') required String id,
  }) = _FolderModel;

  factory FolderModel.fromJson(Map<String, dynamic> json) =>
      _$FolderModelFromJson(json);

  FolderData toFolderData() {
    return FolderData(
      objectId: objectId,
      universityId: int.parse(universityId),
      parentId: int.parse(parentId),
      hasFiles: hasFiles,
      name: name,
      id: int.parse(id),
    );
  }

  Folder toFolder() {
    return Folder(
      objectId: objectId,
      universityId: universityId,
      parentId: parentId,
      hasFiles: hasFiles,
      name: name,
      id: id,
    );
  }
}

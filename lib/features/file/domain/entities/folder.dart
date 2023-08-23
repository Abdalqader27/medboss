import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../core/database/database.dart';

part 'folder.freezed.dart';

part 'folder.g.dart';

@freezed
class Folder with _$Folder {
  const Folder._();
  const factory Folder({
    required String objectId,
    @JsonKey(name: 'UniversityId') required String universityId,
    @JsonKey(name: 'ParentId') required String parentId,
    @JsonKey(name: 'HasFiles') required bool hasFiles,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'ID') required String id,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

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
}
extension ExFolderData on FolderData{
  toFolder(){
    return Folder(
      objectId: objectId,
      universityId: universityId.toString(),
      parentId: parentId.toString(),
      hasFiles: hasFiles,
      name: name,
      id: id.toString(),
    );
  }
}
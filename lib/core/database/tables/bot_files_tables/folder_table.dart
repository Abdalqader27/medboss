import 'package:drift/drift.dart';

@DataClassName('FolderData')
class FoldersTable extends Table {
  TextColumn get objectId => text()();

  @JsonKey(FolderKeys.folderIdKey)
  IntColumn get id => integer()();

  @JsonKey(FolderKeys.nameKey)
  TextColumn get name => text()();

  @JsonKey(FolderKeys.parentIdKey)
  IntColumn get parentId => integer()();

  @JsonKey(FolderKeys.hasFilesKey)
  BoolColumn get hasFiles => boolean()();

  @JsonKey(FolderKeys.universityIdKey)
  IntColumn get universityId => integer()();
}

class FolderKeys {
  static const folderIdKey = 'ID';

  static const nameKey = 'Name';

  static const parentIdKey = 'ParentId';

  static const hasFilesKey = 'HasFiles';

  static const universityIdKey = 'UniversityId';
}

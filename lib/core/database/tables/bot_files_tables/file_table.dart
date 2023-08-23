import 'package:drift/drift.dart';

@DataClassName('FileData')
class FilesTable extends Table {
  TextColumn get objectId => text()();

  @JsonKey(FileKeys.folderIdKey)
  IntColumn get folderId => integer()();

  @JsonKey(FileKeys.nameKey)
  TextColumn get name => text()();

  @JsonKey(FileKeys.myFileKey)
  TextColumn get myFile => text()();

  @JsonKey(FileKeys.universityIdKey)
  IntColumn get universityId => integer()();

  @JsonKey(FileKeys.isActivatedKey)
  BoolColumn get isActivated => boolean()();
}

class FileKeys {
  static const folderIdKey = 'FolderId';

  static const nameKey = 'FileName';

  static const myFileKey = 'MyFile';

  static const universityIdKey = 'UniversityId';

  static const isActivatedKey = 'IsActivated';
}

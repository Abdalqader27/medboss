import 'package:drift/drift.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/core/database/tables/bot_files_tables/file_table.dart';

part 'files_dao.g.dart';

@DriftAccessor(tables: [FilesTable])
class FilesDao extends DatabaseAccessor<AppDatabase> with _$FilesDaoMixin {
  FilesDao(AppDatabase db) : super(db);

  Future removeAll() => delete(db.filesTable).go();

  Future insert(Insertable<FileData> file) => into(db.filesTable).insert(file);

  Future<void> insertAll(List<FileData> files) async {
    await db.filesTable.insertAll(files);
  }

  Future removeUniversityFiles(int universityId) => (delete(db.filesTable)
        ..where((tbl) => tbl.universityId.equals(universityId)))
      .go();

  Future<List<FileData>> getFolderFiles(int folderId) =>
      (select(db.filesTable)..where((tbl) => tbl.folderId.equals(folderId)))
          .get();

  Future<int> getCount() =>
      (select(db.filesTable).get()).then((value) => value.length);
}

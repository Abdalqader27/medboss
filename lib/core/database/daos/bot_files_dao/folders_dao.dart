import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../database.dart';
import '../../tables/bot_files_tables/folder_table.dart';

part 'folders_dao.g.dart';

@DriftAccessor(
  tables: [FoldersTable],
)
class FoldersDao extends DatabaseAccessor<AppDatabase> with _$FoldersDaoMixin {
  FoldersDao(AppDatabase db) : super(db);

  Future<void> insertFolder(FolderData folder) async =>
      await into(db.foldersTable).insert(folder);

  Future<FolderData?> getById(int id) =>
      (select(foldersTable)..where((row) => row.id.equals(id)))
          .get()
          .then((value) => value.toList().firstOrNull);

  Future removeAll() => delete(foldersTable).go();

  Future remove(int universityId) => (delete(foldersTable)
        ..where((row) => row.universityId.equals(universityId)))
      .go();

  Future<List<FolderData>> getSubFolder(int parentId) {
    return (select(foldersTable)..where((row) => row.parentId.equals(parentId)))
          .get();
  }
}

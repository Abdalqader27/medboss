import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:medboss/core/database/daos/bot_files_dao/folders_dao.dart';
import 'package:medboss/core/database/tables/bot_files_tables/file_table.dart';
import 'package:medboss/core/database/tables/bot_files_tables/folder_table.dart';
import 'package:medboss/core/database/tables/purchases_table.dart';
import 'connection/connection.dart' as impl;
import 'daos/bot_files_dao/files_dao.dart';
import 'daos/collages_dao.dart';
import 'daos/purchase_dao.dart';
import 'tables/_tables.dart';

part 'database.g.dart';

const _deleteDatabaseOnStart = false;

@DriftDatabase(
  tables: [
    CollagesTable,
    FoldersTable,
    FilesTable,
    PurchasesTable,
  ],
  daos: [
    CollagesDAO,
    FoldersDao,
    FilesDao,
    PurchasesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.connect());

  AppDatabase.forTesting(DatabaseConnection connection) : super(connection);

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) => m.createAll(),
        beforeOpen: (m) async {
          if (kDebugMode && _deleteDatabaseOnStart) {
            final m = createMigrator();
            for (final table in allTables) {
              await m.deleteTable(table.actualTableName);
              await m.createTable(table);
            }
          }
        },
      );

  @override
  int get schemaVersion => 1;
}

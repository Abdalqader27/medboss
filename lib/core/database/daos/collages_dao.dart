import 'package:medboss/features/collage/data/remote/models/collage_model.dart';

import '../database.dart';
import '../tables/collage_table.dart';
import 'package:drift/drift.dart';

part 'collages_dao.g.dart';

@DriftAccessor(
  tables: [CollagesTable],
)
class CollagesDAO extends DatabaseAccessor<AppDatabase>
    with _$CollagesDAOMixin {
  CollagesDAO(AppDatabase db) : super(db);

  Future<void> insertAll(List<CollageData> collages) async {
    await transaction(
      () => batch(
        (batch) => batch.insertAll(
          db.collagesTable,
          collages,
          mode: InsertMode.insertOrReplace,
        ),
      ),
    );
  }

  Future<List<CollageData>> getAllCollages() async {
    return await select(db.collagesTable).get();
  }
}

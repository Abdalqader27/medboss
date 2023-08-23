import 'package:drift/drift.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/core/database/tables/purchases_table.dart';

part 'purchase_dao.g.dart';

@DriftAccessor(tables: [PurchasesTable])
class PurchasesDao extends DatabaseAccessor<AppDatabase>
    with _$PurchasesDaoMixin {
  final AppDatabase db;

  PurchasesDao(this.db) : super(db);

  Future<bool> isPurchase(String objectId) => (select(db.purchasesTable)
        ..where((tbl) => tbl.fileObjectId.equals(objectId)))
      .get()
      .then((value) => value.isNotEmpty);

  Future<void> addPurchase(PurchaseData purchase) =>
      into(db.purchasesTable).insert(purchase);

  Future<void> addPurchases(List<PurchaseData> purchases) => batch((batch) {
        batch.insertAll(db.purchasesTable, purchases);
      });

  Future<List<PurchaseData>> getAllPurchases() =>
      select(db.purchasesTable).get();
}

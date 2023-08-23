import 'package:drift/drift.dart';

@DataClassName('PurchaseData')
class PurchasesTable extends Table {
  TextColumn get objectId => text()();
  TextColumn get fileObjectId => text()();
}

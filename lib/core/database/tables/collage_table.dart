import 'package:drift/drift.dart';
import 'dart:ui';

import '../mixins/table_mixin.dart';

@DataClassName('CollageData')
class CollagesTable extends Table {
  TextColumn get objectId => text()();

  TextColumn get collageId => text()();

  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {objectId};


}

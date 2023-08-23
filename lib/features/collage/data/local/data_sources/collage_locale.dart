import 'package:drift/drift.dart';

import '../../../../../core/database/database.dart';
import '../../../../../core/storage/storage_service.dart';
import '../../remote/models/collage_model.dart';

class CollageLocale {
  CollageLocale(this._db);


  final AppDatabase _db;

  Future<void> cacheAllCategories(List<CollageModel> collages) async {
    await _db.collagesDAO.insertAll(
      collages.map((e) => e.toData()).toList(),
    );
  }

  Future<List<CollageData>> getAllCollages() async {
    return await _db.collagesDAO.getAllCollages();
  }

}

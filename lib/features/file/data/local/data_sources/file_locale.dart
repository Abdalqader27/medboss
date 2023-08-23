import 'dart:io';

import 'package:core/core.dart';
import 'package:drift/drift.dart';

import '../../../../../core/database/database.dart';
import '../../remote/models/file_model.dart';

class FileLocale {
  FileLocale(this._db);

  final AppDatabase _db;

  Future<void> cacheAllFiles(List<FileModel> files) async {
    await _db.filesDao.insertAll(
      files.map((e) => e.toData()).toList(),
    );
  }

  Future<List<FileData>> getFilesByFolderId(int folderId) async {
    return await _db.filesDao.getFolderFiles(folderId);
  }
}

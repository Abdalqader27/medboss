import 'package:flutter/material.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/features/file/data/remote/data_sources/file_remote_client.dart';

import '../../../../../core/database/daos/bot_files_dao/files_dao.dart';
import '../../../../../core/database/daos/bot_files_dao/folders_dao.dart';
import '../../../../../core/database/daos/purchase_dao.dart';
import '../../../../../core/injections/service_locator.dart';
import '../../../../../core/storage/storage_service.dart';
import '../../../../collage/data/local/data_sources/collage_locale.dart';
import '../../../../collage/presentation/pages/select_collage/select_collage_stream.dart';
import '../../../domain/entities/file.dart';
import '../../../domain/entities/folder.dart';

class BotFilesProvider extends ChangeNotifier {
  dynamic _last;

  List<dynamic> _list = [];

  dynamic get last => _last;

  List<dynamic> get list => _list;

  bool loadingUFolder = true;

  late final AppDatabase _botDatabase;
  late final FilesDao _filesDao;
  late final FoldersDao _foldersDao;
  late final PurchasesDao _purchasesDao;

  BotFilesProvider(AppDatabase db) {
    _botDatabase = db;
    _filesDao = _botDatabase.filesDao;
    _foldersDao = _botDatabase.foldersDao;
    _purchasesDao = _botDatabase.purchasesDao;
    getUPath();
  }

  getUPath({bool? refresh}) async {
    if (!loadingUFolder) {
      loadingUFolder = true;
      notifyListeners();
    }

    final selectedCollage = sl<IStorageService>().getString(selectedCollageKey);
    int uId = int.parse(selectedCollage!);
    Folder? folder;
    if (refresh ?? false) {
      folder = null;
    } else {
      folder = (await getFolderFromDatabase(uId))?.toFolder();
    }

    folder ??= await getFolderFromServer(uId);

    if (folder != null) {
      _list = [];
      _list.add(folder);
      _last = _list.last;
    }
    loadingUFolder = false;
    notifyListeners();
  }

  Future<FolderData?> getFolderFromDatabase(int uId) async {
    return await _foldersDao.getById(uId);
  }

  getFolderFromServer(int uId) async {
    FileRemoteClient apiClient = FileRemoteClient();
    Folder? folder;
    folder = await apiClient.getUFolder(uId);

    List<Folder>? foldersList = [];
    List<File>? fileList = [];
    try {
      foldersList = await apiClient.getUFolders(uId);
      fileList = await apiClient.getUFiles(uId);
    } catch (_) {}
    if (folder != null && foldersList != null && fileList != null) {
      await _foldersDao.remove(uId);
      await _filesDao.removeUniversityFiles(uId);
      _foldersDao.insertFolder(folder.toFolderData());
      for (File file in fileList) {
        await _filesDao.insert(file.toFileDate());
      }

      for (Folder folder in foldersList) {
        await _foldersDao.insertFolder(folder.toFolderData());
      }
    }

    return folder;
  }

  addItem(dynamic folder) {
    _list.add(folder);
    _last = list.last;
    notifyListeners();
  }

  removeUntil(int index) {
    int length = _list.length;
    for (int i = index; i < length; i++) {
      _list.removeLast();
    }
    _last = _list.last;
    notifyListeners();
  }

  Future<bool> isPurchase(String objectId) async {
    return _purchasesDao.isPurchase(objectId);
  }

  removeLast() {
    _list.removeLast();
    _last = _list.last;
    notifyListeners();
  }
}

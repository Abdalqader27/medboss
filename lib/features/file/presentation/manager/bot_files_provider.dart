// import 'package:design/design.dart';
//
// class BotFilesProvider extends ChangeNotifier {
//   Folder _last;
//
//   List<dynamic> _list = [];
//
//   Folder get last => _last;
//
//   List<dynamic> get list => _list;
//
//   bool loadingUFolder = true;
//
//   BotDatabase _botDatabase;
//   FilesDao _filesDao;
//   FoldersDao _foldersDao;
//   PurchasesDao _purchasesDao;
//
//   BotFilesProvider(BotDatabase db) {
//     _botDatabase = db;
//     _filesDao = _botDatabase.filesDao;
//     _foldersDao = _botDatabase.foldersDao;
//     _purchasesDao = _botDatabase.purchasesDao;
//     getUPath();
//   }
//
//   getUPath({bool? refresh}) async {
//     if (!loadingUFolder) {
//       loadingUFolder = true;
//       notifyListeners();
//     }
//     // int uId =
//     //     await SharedPrefsHelper().getSharedPreference('UniversitySelectID', 3);
//     Folder folder;
//     if (refresh ?? false) {
//       folder = null;
//     } else {
//       folder = await getFolderFromDatabase(uId);
//     }
//     folder ??= await getFolderFromServer(uId);
//
//     if (folder != null) {
//       _list = [];
//       _list.add(folder);
//       _last = _list.last;
//     }
//     loadingUFolder = false;
//     notifyListeners();
//   }
//
//   getFolderFromDatabase(int uId) async {
//     return await _foldersDao.getUFolder(uId);
//   }
//
//   getFolderFromServer(int uId) async {
//     ApiClient apiClient = ApiClient();
//     Folder folder;
//     folder = await apiClient.getUFolder(uId);
//
//     List<Folder> _foldersList = [];
//     List<File> _fileList = [];
//
//     _foldersList = await apiClient.getUFolders(uId);
//     _fileList = await apiClient.getUFiles(uId);
//
//     if (folder != null && _fileList != null && _foldersList != null) {
//       await _foldersDao.removeUFolders(uId);
//       await _filesDao.removeUFiles(uId);
//       _foldersDao.insertFolder(FoldersCompanion(
//         name: Value(folder.name),
//         hasFiles: Value(folder.hasFiles),
//         id: Value(folder.id),
//         parentId: Value(-1),
//         universityId: Value(uId),
//       ));
//       for (File file in _fileList) {
//         await _filesDao.insertFile(
//           FilesCompanion(
//             name: Value(file.name),
//             folderId: Value(file.folderId),
//             myFile: Value(file.myFile),
//             universityId: Value(uId),
//             objectId: Value(file.objectId),
//             isActivated: Value(file.isActivated),
//             createdAt: Value(file.createdAt),
//           ),
//         );
//       }
//
//       for (Folder folder in _foldersList) {
//         await _foldersDao.insertFolder(folder);
//       }
//     }
//
//     return folder;
//   }
//
//   addItem(dynamic folder) {
//     _list.add(folder);
//     _last = list.last;
//     notifyListeners();
//   }
//
//   void removeUntil(int index) {
//     int length = _list.length;
//     for (int i = index; i < length; i++) {
//       _list.removeLast();
//     }
//     _last = _list.last;
//     notifyListeners();
//   }
//
//   Future<bool> isPurchase(String objectId) async {
//     return _purchasesDao.isPurchase(objectId);
//   }
//
//   removeLast() {
//     _list.removeLast();
//     _last = _list.last;
//     notifyListeners();
//   }
// }

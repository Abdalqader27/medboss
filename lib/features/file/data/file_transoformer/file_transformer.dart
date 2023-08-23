import 'package:core/core.dart';
import 'package:medboss/core/database/database.dart';
import 'package:medboss/features/file/data/remote/models/file_model.dart';
import 'package:medboss/features/file/domain/entities/file.dart';
import 'package:medboss/features/file/domain/entities/folder.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../common/utils/i_transformer.dart';
import '../remote/models/folder_model.dart';

Future<FolderModel> parseRemoteFolder(ParseResponse response) async {
  if (response.success && response.result != null) {
    final result = response.result as List<dynamic>;
    return FolderModel.fromJson(result.first.toJson());
  }
  throw AppException(
    message: response.error?.message ?? '',
    exception: Exception(response.error?.code.toString()),
  );
}

Future<List<FolderModel>> parseRemoteFolders(ParseResponse response) async {
  if (response.success && response.result != null) {
    final results = response.results;
    final folders = results!.map((e) {
      return FolderModel.fromJson(e.toJson());
    }).toList();
    return folders;
  }
  throw AppException(
    message: response.error?.message ?? '',
    exception: Exception(response.error?.code.toString()),
  );
}

Future<List<FileModel>> parseRemoteFiles(ParseResponse response) async {
  if (response.success && response.result != null) {
    final results = response.results;
    final files = results!.map(
      (e) {
        return FileModel.fromJson(e.toJson());
      },
    ).toList();
    return files;
  }
  throw AppException(
    message: response.error?.message ?? '',
    exception: Exception(response.error?.code.toString()),
  );
}

class FilesModelTransformer extends ITransformer<List<FileModel>, List<File>> {
  FilesModelTransformer(super.model);

  @override
  List<File> transform() {
    return model.map((e) => e.toFile()).toList();
  }
}

class FilesDataTransformer extends ITransformer<List<FileData>, List<File>> {
  FilesDataTransformer(super.model);

  @override
  List<File> transform() {
    return model.map((e) => e.toFile()).toList();
  }
}

class FoldersModelTransformer
    extends ITransformer<List<FolderModel>, List<Folder>> {
  FoldersModelTransformer(super.model);

  @override
  List<Folder> transform() {
    return model.map((e) => e.toFolder()).toList();
  }
}

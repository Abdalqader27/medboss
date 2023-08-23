import 'dart:async';

import 'package:core/core.dart';
import 'package:medboss/features/file/data/file_transoformer/file_transformer.dart';
import 'package:medboss/features/file/data/local/data_sources/file_locale.dart';
import 'package:medboss/features/file/domain/repositories/i_file_repository.dart';

import '../../../../common/utils/i_transformer.dart';
import '../remote/data_sources/file_remote.dart';

class FileRepository extends IFileRepository {
  FileRepository(this.fileRemote, this.fileLocale);

  final FileRemote fileRemote;
  final FileLocale fileLocale;

  @override
  FutureOr<ITransformer> getFiles(Params params) {
    return throwAppException(
      () async {
        // params => universityId, folderId, fetchPolicy
        final folderId = params.get<int>('folderId');

        final fetchPolicy = params.fetchPolicy;
        final fetchNetwork = fetchPolicy.isNetworkPolicy;

        final localeFiles = await fileLocale.getFilesByFolderId(folderId);
        if (localeFiles.isEmpty || fetchNetwork) {
          final response = await fileRemote.getFilesByUniversityId(params);
          final remoteFiles = await parseRemoteFiles(response);

          await fileLocale.cacheAllFiles(remoteFiles);

          return FilesModelTransformer(remoteFiles);
        }
        return FilesDataTransformer(localeFiles);
      },
    );
  }

  @override
  FutureOr<ITransformer> getFolderById(Params params) {
    // TODO: implement getFolderById
    throw UnimplementedError();
  }

  @override
  FutureOr<ITransformer> getFolders(Params params) {
    // TODO: implement getFoldersByUniversityId
    throw UnimplementedError();
  }
}

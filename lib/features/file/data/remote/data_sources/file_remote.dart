import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FileRemote {
  FileRemote();

  final folders = ParseObject('Folders', debug: kDebugMode);
  final files = ParseObject('Files', debug: kDebugMode);

  final _id = 'ID';
  final _universityId = 'UniversityId';

  Future<ParseResponse> getFolderById(Params params) async {
    final id = params.id;
    final queryBuilder = QueryBuilder<ParseObject>(folders)
      ..whereEqualTo(_id, id);
    final response = await queryBuilder.query();
    return response;
  }

  Future<ParseResponse> getFoldersByUniversityId(Params params) async {
    final universityId = params.id;

    final queryBuilder = QueryBuilder<ParseObject>(folders)
      ..whereEqualTo(_universityId, universityId);
    final response = await queryBuilder.query();
    return response;
  }

  Future<ParseResponse> getFilesByUniversityId(Params params) async {
    final universityId = params.id;

    final queryBuilder = QueryBuilder<ParseObject>(files)
      ..whereEqualTo(_universityId, universityId);
    final response = await queryBuilder.query();
    return response;
  }
}

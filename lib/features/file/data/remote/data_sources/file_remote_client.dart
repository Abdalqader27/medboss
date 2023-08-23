import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../domain/entities/file.dart';
import '../../../domain/entities/folder.dart';

class FileRemoteClient {
  Future<Folder?> getUFolder(int uId) async {
    List<Folder> myList;

    ParseObject foldersObject = ParseObject('Folders', debug: kDebugMode);
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(foldersObject)..whereEqualTo('ID', '$uId');
    final response = await queryBuilder.query();

    if (response.success && response.count != 0) {
      myList = List<Folder>.from(json
          .decode(response.result.toString())
          .map((x) => Folder.fromJson(x)));
      return myList.first;
    }
    return null;
  }

  Future<List<File>?> getUFiles(int uId) async {
    ParseObject foldersObject = ParseObject('Files');
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(foldersObject)
          ..whereEqualTo('UniversityId', '$uId');
    final response = await queryBuilder.query();

    if (response.success && response.count != 0) {
      log(response.result.toString());

      final files = response.results!.map(
        (e) {
          final ParseFile file=e['MyFile'];
          e['MyFile'] = UrlFile(name: file.name, url: file.url!).toJson();
          return File.fromJson(e.toJson());
        },
      ).toList();
      return files;
    }
    return null;
  }

  Future<List<Folder>?> getUFolders(int uId) async {
    List<Folder> myList;

    ParseObject foldersObject = ParseObject('Folders');
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(foldersObject)
          ..whereEqualTo('UniversityId', '$uId');
    final response = await queryBuilder.query();

    if (response.success && response.count != 0) {
      myList = List<Folder>.from(json
          .decode(response.result.toString())
          .map((x) => Folder.fromJson(x)));
      return myList;
    }
    return null;
  }
}

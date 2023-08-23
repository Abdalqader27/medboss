import 'package:core/core.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CollageRemote {
  final collageParser = ParseObject('Collage');

  Future<ParseResponse> getAllCollage(Params params) async {
    final queryBuilder = QueryBuilder<ParseObject>(collageParser);
    final response = await queryBuilder.query();
    return response;
  }

  Future<ParseResponse> getCollageById(Params params) async {
    final queryBuilder = QueryBuilder<ParseObject>(collageParser)
      ..whereEqualTo('objectId', params.id);
    final response = await queryBuilder.query();
    return response;
  }
}

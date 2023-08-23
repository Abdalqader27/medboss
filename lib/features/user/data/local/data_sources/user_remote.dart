import 'package:core/core.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserRemote {
  UserRemote._();

  static final instance = UserRemote._();

  factory UserRemote() => instance;
  final _codeParserObject = ParseObject('Codes');

  Future<ParseResponse> getUserCodes(Params params) async {
    final queryBuilder = QueryBuilder<ParseObject>(_codeParserObject)
      ..whereEqualTo(
        'userId',
        params.get<String>('userId'),
      );

    var response = await queryBuilder.query();
    return response;
  }
}

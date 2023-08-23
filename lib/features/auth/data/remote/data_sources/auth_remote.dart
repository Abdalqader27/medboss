import 'package:core/core.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../parser/account_parser.dart';

class AuthRemote {
  final _accountParserObject = AccountParser();

  Future<ParseResponse> login(Params params) async {
    const keyPhoneNumber = AccountParser.keyPhoneNumber;
    const keyPassword = AccountParser.keyPassword;

    final phoneNumberQuery = QueryBuilder<AccountParser>(_accountParserObject)
      ..whereEqualTo(
        keyPhoneNumber,
        params.get<String>(keyPhoneNumber),
      );

    final passwordQuery = QueryBuilder<AccountParser>(_accountParserObject)
      ..whereEqualTo(
        keyPassword,
        params.get<String>(keyPassword),
      );

    final queryBuilder = QueryBuilder.and(
      _accountParserObject,
      [phoneNumberQuery, passwordQuery],
    );

    var response = await queryBuilder.query();
    return response;
  }

  Future<ParseResponse> signUp(Params params) async {
    _accountParserObject
      ..setPhoneNumber = params.get<String>(AccountParser.keyPhoneNumber)
      ..setPassword = params.get<String>(AccountParser.keyPassword)
      ..setFullName = params.get<String>(AccountParser.keyFullName)
      ..setEmail = params.get<String>(AccountParser.keyEmail)
      ..setCity = params.get<String>(AccountParser.keyCity);
    return _accountParserObject.save();
  }

  Future<bool> checkIfUserHasExisted(Params params) async {
    final phoneNumber = params.get<String>(AccountParser.keyPhoneNumber);
    final password = params.get<String>(AccountParser.keyPassword);
    return await _accountParserObject.isExistedUser(
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}

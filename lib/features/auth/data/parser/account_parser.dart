import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AccountParser extends ParseObject implements ParseCloneable {
  AccountParser() : super(_keyTableName);

  AccountParser.clone() : this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override
  clone(Map<String, dynamic> map) => AccountParser.clone()..fromJson(map);

  static const String _keyTableName = 'Account';
  static const String keyObjectId = 'objectId';
  static const String keyPhoneNumber = 'phoneNumber';
  static const String keyPassword = 'password';
  static const String keyFullName = 'fullName';
  static const String keyEmail = 'email';
  static const String keyCity = 'city';


  String get phoneNumber => get<String>(keyPhoneNumber) ?? '';
  String get password => get<String>(keyPassword) ?? '';
  String get fullName => get<String>(keyFullName) ?? '';
  String get email => get<String>(keyEmail) ?? '';
  String get city => get<String>(keyCity) ?? '';


  set setPhoneNumber(String phoneNumber) => set<String>(keyPhoneNumber, phoneNumber);
  set setPassword(String password) => set<String>(keyPassword, password);
  set setFullName(String fullName) => set<String>(keyFullName, fullName);
  set setEmail(String email) => set<String>(keyEmail, email);
  set setCity(String city) => set<String>(keyCity, city);

  Future<bool> isExistedUser({
    required String phoneNumber,
    required String password,
  }) async {
    var queryBuilder = QueryBuilder<AccountParser>(AccountParser())
      ..whereEqualTo(keyPhoneNumber, phoneNumber)
      ..whereEqualTo(keyPassword, password);

    var response = await queryBuilder.query();

    return response.success && response.result != null;
  }
}

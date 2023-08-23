import 'dart:developer';

import 'package:core/core.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginParams extends Params {
  LoginParams({
    required this.phoneNumber,
    required this.password,
  });

  final String phoneNumber;
  final String password;

  @override
  Map<String, dynamic> toMap() {
    log('LoginParams.toMap: $phoneNumber, $password');

    return {
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      phoneNumber: (map['phoneNumber'] as PhoneNumber)
          .completeNumber
          .replaceAll('+', '00'),
      password: map['password'] as String,
    );
  }
}

import 'package:core/core.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignUpParams extends Params {
  final String phoneNumber;
  final String fullName;
  final String password;
  final String email;
  final String city;

  SignUpParams({
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.city,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'city': city,
    };
  }

  factory SignUpParams.fromMap(Map<String, dynamic> map) {
    return SignUpParams(
      password: map['password'],
      fullName: map['fullName'],
      phoneNumber: (map['phoneNumber'] as PhoneNumber)
          .completeNumber
          .replaceAll('+', '00'),
      email: map['email'],
      city: map['city'],
    );
  }
}

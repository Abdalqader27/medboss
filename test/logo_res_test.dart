import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:medboss/resources/resources.dart';

void main() {
  test('logo_res assets test', () {
    expect(File(LogoRes.darkLogo).existsSync(), true);
    expect(File(LogoRes.lightLogo).existsSync(), true);
    expect(File(LogoRes.logo).existsSync(), true);
  });
}

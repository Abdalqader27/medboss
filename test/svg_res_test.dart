import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:medboss/resources/resources.dart';

void main() {
  test('svg_res assets test', () {
    expect(File(SvgRes.background).existsSync(), true);
    expect(File(SvgRes.stethoscope).existsSync(), true);
  });
}

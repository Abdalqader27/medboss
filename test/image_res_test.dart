import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:medboss/resources/resources.dart';

void main() {
  test('image_res assets test', () {
    expect(File(ImageRes.backaground).existsSync(), true);
    expect(File(ImageRes.education).existsSync(), true);
    expect(File(ImageRes.friendship).existsSync(), true);
    expect(File(ImageRes.medbossBlue).existsSync(), true);
  });
}
